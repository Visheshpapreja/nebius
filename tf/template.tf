data "template_file" "user_data" {
template = <<-EOF
#!/bin/bash

    # Update packages
sudo apt-get update -y

    # Install Nginx

    # Stop Nginx service
sudo service nginx stop
sudo chmod -R 777 /usr/share/nginx/html/
    # Replace default index.html file

sudo chmod 777 /etc/nginx/nginx.conf
sudo cat <<EOL > /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
       server {
        # Existing server configuration...

        location /page1/ {
            root /usr/share/nginx/html;
            index index.html index.nginx-debian.html;
        }

        # Other location blocks if any...
    }

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}

EOL
sudo mkdir /usr/share/nginx/html/page1
sudo rm /etc/nginx/sites-enabled/default
sudo cat <<EOL > /usr/share/nginx/html/page1/index.html
<!DOCTYPE html>
<html>
<head>
  <title>This is first backend group</title>
</head>
<body>
  <h1>Hello, This is first backend group</h1>
  <p>This is a sample web page served by the EC2 instance.</p>
</body>
</html>
EOL
    # Start Nginx service
sudo service nginx start
EOF

}


data "template_file" "user_data2" {
template = <<-EOF
#!/bin/bash

    # Update packages
sudo apt-get update -y

    # Install Nginx

    # Stop Nginx service
sudo service nginx stop
sudo chmod -R 777 /usr/share/nginx/html/
    # Replace default index.html file

sudo chmod 777 /etc/nginx/nginx.conf
sudo cat <<EOL > /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
       server {
        # Existing server configuration...

        location /page2/ {
            root /usr/share/nginx/html;
            index index.html index.nginx-debian.html;
        }

        # Other location blocks if any...
    }

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}

EOL
sudo mkdir /usr/share/nginx/html/page2
sudo chmod -R 755 /usr/share/nginx/html/page2
sudo rm /etc/nginx/sites-enabled/default
sudo cat <<EOL > /usr/share/nginx/html/page2/index.html
<!DOCTYPE html>
<html>
<head>
  <title>This is second backend group</title>
</head>
<body>
  <h1>Hello, This is second backend group<</h1>
  <p>This is a sample web page served by the EC2 instance.</p>
</body>
</html>
EOL
    # Start Nginx service
sudo service nginx start
EOF
}
resource "aws_launch_template" "backend_template1" {
  name          = "backend-template-1"
  image_id      = "ami-0743b221e6da85f58"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name  = "k8s_managing_node" 
  user_data = base64encode(data.template_file.user_data.rendered)

  # Additional configuration options as needed
}

resource "aws_launch_template" "backend_template2" {
  name          = "backend-template-2"
  image_id      = "ami-0743b221e6da85f58"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name  = "k8s_managing_node"
  user_data = base64encode(data.template_file.user_data2.rendered)

  # Additional configuration options as needed
}

