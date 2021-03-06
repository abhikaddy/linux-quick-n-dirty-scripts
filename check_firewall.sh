#!/bin/bash
echo "$(cat host_port.txt)" | \
while read host port; do
  r=$(bash -c 'exec 3<> /dev/tcp/'$host'/'$port';echo $?' 2>/dev/null)
  if [ "$r" = "0" ]; then
    echo $host $port is open
  else
    echo $host $port is closed
  fi
done

#host_port.txt file contains lines like --> "1.2.3.4 2200"
