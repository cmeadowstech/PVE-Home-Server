#!/bin/bash

# Set TECHNITIUM_API_TOKEN environment variable

while getopts h:d: flag
do
    case "${flag}" in
        h) HOSTNAME=${OPTARG};;
        d) DOMAIN=${OPTARG};;
    esac        
done

curl --request GET \
  --url "http://10.0.11.2:5380/api/zones/records/add?token=$TECHNITIUM_API_TOKEN&zone=home&domain=$HOSTNAME.home&type=CNAME&ttl=&overwrite=true&expiryTtl=&cname=$DOMAIN"