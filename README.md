# Squidly

# Description
This script is designed to check whether a set of ports on a proxy server are open and returning a successful HTTP response. It does this by sending HTTP requests to each port in a specified range, using a given proxy server to route the requests. It only reports ports as "open" if the response indicates success, meaning the server returns a valid HTTP status code in the 2xx range (e.g., 200 OK, 201 Created)
