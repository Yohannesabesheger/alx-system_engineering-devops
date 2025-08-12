# 0x0F-load_balancer

## Description
This project is part of the ALX System Engineering & DevOps track.  
The goal is to set up a load-balanced web server environment with **web-01** and **web-02**.  
In this first task, we configure **Nginx** on both servers to return a custom HTTP response header `X-Served-By` containing the hostname of the server handling the request.

This helps us:
- Identify which server responded to a request.
- Understand how a load balancer distributes requests.

---

## Files
### `0-custom_http_response_header`
A Bash script that:
1. Installs Nginx on a fresh Ubuntu machine.
2. Configures Nginx to include a custom HTTP header:
   - Name: `X-Served-By`
   - Value: Server hostname
3. Restarts Nginx to apply changes.

---

## Requirements
- OS: Ubuntu 20.04 LTS
- Nginx installed and running
- Script should be executable:  
  ```bash
  chmod +x 0-custom_http_response_header

