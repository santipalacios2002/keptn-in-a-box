#!/bin/bash

# we build the image and tag it
docker build -t pcjeffmac/nginxacm:0.8.1 .

# Pushit to dockerhub
docker push pcjeffmac/nginxacm:0.8.1