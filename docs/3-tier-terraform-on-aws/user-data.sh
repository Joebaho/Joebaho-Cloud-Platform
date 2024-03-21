# USER DATA 
# Use this script from top to bottom to update and install httpd (Linux 2 version)

#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Welcome to the web tier Application launch via Terraform by $(hostname -f) </h1>" > /var/www/html/index.html