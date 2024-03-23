Server 1

#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo '<html><body><h1 style="color:Red;">Welcome to Apache web page running on Server 1 </h1></body></html>' > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd


Server 2

#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo '<html><body><h1 style="color:Blue;">Welcome to Apache web page running on Server 2 </h1></body></html>' > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd