# linux-quick-n-dirty-scripts

This repository contains shell scripts which aims solve/troubleshoot day-to-day problems which an SRE/DevOps engineers might face.
## Documentation

1. bash_logging_framework.sh - This shell snippet contains a logging framework which can be plugged and played in any shell script. It provides simple and easy way to log messages and different levels - INFO, WARNING, ERROR, DEBUG

2. check_firewall.sh - This shell snippet enables us to test if firewall is open between current host and given list of destination host and ports.

3. gcp-to-aws-cross-account-authn.sh - This shell script can be used to aquire a temporary AWS Credentials from its STS endpoint. This script should be run from a GCP Resource (GKE, VM etc) which has a service account attached to it. That service account needs to be setup to have a trust relationship with an AWS IAM Role. That IAM Role ARN is then passed to the script as 1st input and GCP Project ID as 2nd input.

