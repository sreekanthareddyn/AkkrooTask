#!/bin/sh

lb () {
    echo "This is lb function"
    sudo apt-get install -y nginx
    sudo service nginx stop
    sudo rm -rf /etc/nginx/sites-available/default
    sudo touch /etc/nginx/sites-available/default
       echo "upstream lb {
            server 192.168.1.16;
            server 192.168.1.17;
        }

        server {
            listen 80 default_server;
            listen [::]:80 default_server ipv6only=on;

            root /usr/share/nginx/html;
            index index.html index.htm;

            # Make site accessible from http://localhost/
            server_name localhost;

                location / {
                    proxy_pass http://lb;
                }
        }" >> /etc/nginx/sites-enabled/default
    
    sudo service nginx start	
}

web () {
    echo "This is web function"
    sudo apt-get install -y nginx
    echo "<html><body><h1>Hello World</h1></body></html>" > /usr/share/nginx/html/index.html
    echo "<h1>akkroo"$1"</h1>" >> /usr/share/nginx/html/index.html
}

if [ $1 = web ]; then
web $2
elif [ $1 = lb ]; then
lb
else
 echo "Unrecognised parameter hence exiting"
fi	
