#!/bin/sh

lb () {
    echo "This is lb function"
    sudo apt-get update -y
    sudo apt-get install -y nginx
}

web () {
    echo "This is web function"
    sudo apt-get update -y
    sudo apt-get install -y nginx
}

if [ $1 = web ]; then
web
elif [ $1 = lb ]; then
lb
else
 echo "Unrecognised parameter hence exiting"
fi	
