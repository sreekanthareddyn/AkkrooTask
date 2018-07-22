#!/bin/sh

# function for installing and configuring nginx on loadbalance server
lb () {
    #echo "This is lb function"
    sudo apt-get install -y nginx
    sudo service nginx stop
    sudo rm -rf /etc/nginx/sites-available/default
    sudo touch /etc/nginx/sites-available/default
        echo "upstream lb {
            server $1;
            server $2;
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

# function for installing and configuring nginx on web server
web () {
    #echo "This is web function"	
    sudo apt-get install -y nginx
    echo "<html><body><h1>Hello World</h1></body></html>" > /usr/share/nginx/html/index.html
    echo "<h1>akkroo"$1"</h1>" >> /usr/share/nginx/html/index.html
}

# Calling web or loadbancer functions depends on the input parameter from vagrant file

if [ $1 = web ]; then
web $2          # $2 holds webserver name which is passed to web function to update index.html
elif [ $1 = lb ]; then
lb $2 $3        # $2 and $3 holds webserver IP's which is passed to lb function to configure loadbalancing     
else
    echo "Unrecognised parameter hence exiting"
fi

