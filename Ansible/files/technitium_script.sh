#!/bin/bash

# Set TECHNITIUM_API_TOKEN environment variable

while getopts h:i: flag
do
    case "${flag}" in
        h) HOSTNAME=${OPTARG};;
        i) IP=${OPTARG};;
    esac        
done

curl --request GET \
  --url "http://10.0.0.234:5380/api/zones/records/add?token=$TECHNITIUM_API_TOKEN&zone=local&domain=$HOSTNAME.local&type=A&overwrite=true&ipAddress=$IP&ptr=false&createPtrZone=false&updateSvcbHints=false"