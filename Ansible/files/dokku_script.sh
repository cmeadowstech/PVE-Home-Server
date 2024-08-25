#!/bin/bash

while getopts h:i:p: flag
do
    case "${flag}" in
        h) HOSTNAME=${OPTARG};;
        i) IP=${OPTARG};;
        p) PORT=${OPTARG};;
    esac        
done

# for a service listening on:
# - ip address: $IP
# - port: $PORT
# create the app
dokku apps:create $HOSTNAME

# set the builder to the null builder, which does nothing
dokku builder:set $HOSTNAME selected null

# set the scheduler to the null scheduler, which does nothing

# for dokku 0.26+
dokku scheduler:set $HOSTNAME selected null

# set the static-web-listener network property to the ip:port combination for your app.
dokku network:set $HOSTNAME static-web-listener $IP:$PORT

# set the port map as desired for the port specified in your static-web-listener
dokku ports:set $HOSTNAME http:80:$PORT
dokku ports:remove $HOSTNAME http:80:5000

# set the domains desired
dokku domains:set $HOSTNAME $HOSTNAME.cmeadows.tech

# build the proxy config
dokku proxy:build-config $HOSTNAME

# enable ssl
dokku letsencrypt:set $HOSTNAME email codyrm@gmail.com
dokku letsencrypt:enable $HOSTNAME  
dokku letsencrypt:auto-renew $HOSTNAME