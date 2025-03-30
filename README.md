# Squidly

# Description
This Bash script scans ports through a specified proxy server using either HTTP or HTTPS. 

By default, it scans all ports (1-65535) but allows specifying a custom range with the -p flag. 

It uses curl to check for open ports by verifying if the HTTP response code is in the 2xx range, indicating a successful connection.

# Simple explanation
This script uses the proxy against itself to check localports that are available to itself

```
YOU   --> QUERY   --> PROXY 
PROXY --> QUERY   --> PROXY (ITSELF)
PROXY --> RESPONE --> YOU
```

# Usage
Download SQUIDLY and modify the `squidly.sh` 
```
git clone https://github.com/bwithe/squidly
```
Executee the script
```
bash squidly.sh -proxy 192.168.1.100:3128 -https # scans all ports by default
bash squidly.sh -proxy 192.168.1.100:3128 -p 8000-9000 -http  # scans ports 8000-9000 

```

# FYI
There is another useful tool `proxytunnel` that will allow you to establish connections to the interal (localhost) of a proxyserver. 

So, use this if with just want to scan the interal ports of a proxy server. 

But, if you want to ssh to an interal session on the Proxy server: `proxytunnel` is the tool you'd want.
git clone https://github.com/bwithe/squidly
cd squidly
chmod +x squidly.sh
./squidly
```
