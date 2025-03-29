#!/bin/bash

# Default values
proxyip=""
proxyport=""
portrange=$(seq 1 65535)  # Default: scan all ports
protocol="http"

# Usage function
usage() {
    echo "Usage: $0 -proxy <proxy_ip:port> [-p <port_range>] [-http | -https]"
    echo "Example: $0 -proxy 192.168.1.100:3128 -p 8000-9000 -http"
    echo "         $0 -proxy 192.168.1.100:3128 -https (scans all ports by default)"
    exit 1
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -proxy)
            IFS=':' read -r proxyip proxyport <<< "$2"
            shift 2
            ;;
        -p)
            IFS='-' read -r start_port end_port <<< "$2"
            portrange=$(seq "${start_port:-1}" "${end_port:-65535}")
            shift 2
            ;;
        -http)
            protocol="http"
            shift
            ;;
        -https)
            protocol="https"
            shift
            ;;
        *)
            echo "Invalid argument: $1"
            usage
            ;;
    esac
done

# Validate proxy settings
if [[ -z "$proxyip" || -z "$proxyport" ]]; then
    echo "Error: Proxy IP and port are required."
    usage
fi

# Scanning ports
echo "Scanning ports using $protocol via proxy $proxyip:$proxyport..."

for port in $portrange; do
    # Use curl to test the connection through the proxy
    http_code=$(curl -skL --proxy "$protocol://$proxyip:$proxyport" "$protocol://$proxyip:$port" -w "%{http_code}" -o /dev/null)

    if [[ "$http_code" -ge 200 && "$http_code" -lt 300 ]]; then
        echo "Port open: $port"
    fi
done

echo "Scan completed."
