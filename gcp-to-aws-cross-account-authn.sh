#!/bin/bash

# Check if two arguments were provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 AWS-ARN GCP-PROJECT-ID"
  exit 1
fi
arn="$1"
#echo "AWS ARN passed is $arn"
project_id="$2"
#echo "GCP Project ID passed is $project_id"
instance_name=$(curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
#echo $instance_name
token=$(curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/identity?audience=gcp&format=standard)
#echo $token

awstmpcreds=$(curl -s -X POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Accept: application/json" \
  -d "Action=AssumeRoleWithWebIdentity" \
  -d "Version=2011-06-15" \
  -d "RoleArn=$arn" \
  -d "WebIdentityToken=$token" \
  -d "RoleSessionName=$project_id-$instance_name" \
  https://sts.us-east-1.amazonaws.com/)

echo $awstmpcreds