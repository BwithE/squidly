# Squidly

# FYI
I just found another useful tool `proxytunnel` that will allow you to establish connections to the interal (localhost) of a proxyserver. So, use this if with just want to scan the interal ports of a proxy server. But, if you want to ssh to an interal session on the Proxy server: `proxytunnel` is the tool you'd want.


# Description
This script is designed to check whether a set of ports on a proxy server are open and returning a successful HTTP response. 

It does this by sending HTTP requests to each port in a specified range, using a given proxy server to route the requests. 

It only reports ports as "open" if the response indicates success, meaning the server returns a valid HTTP status code in the 2xx range (e.g., 200 OK, 201 Created)

# Simple explanation
This script uses the proxy against itself to check localports that are available to itself

```
YOU   --> QUERY   --> PROXY 
PROXY --> QUERY   --> PROXY (ITSELF)
PROXY --> RESPONE --> YOU
```

# Usage
Download SQUIDLY and modify the `squidly.sh` 
  - `proxyip`
  - `proxyport`
  - `portrange`
```
git clone https://github.com/bwithe/squidly
cd squidly
chmod +x squidly.sh
./squidly
```
