#!/bin/bash
# usage 
# bash squidly.sh
# ./squidly.sh

# Set proxy IP and port
proxyip="<PROXY IP>"
proxyport="<PROXY PORT>"
portrange=$(seq 8000 9000)  # Generate port range from 8000-9000

for port in $portrange
do
    # Use curl to check if the proxy server is reachable on the current port
    http_code=$(curl -skL --proxy http://$proxyip:$proxyport http://$proxyip:$port -w "%{http_code}" -o /dev/null)

    # Check if the HTTP response code is 2xx (successful response)
    if [[ "$http_code" -ge 200 && "$http_code" -lt 300 ]]; then
        echo "Port open: $port"
    fi
done
