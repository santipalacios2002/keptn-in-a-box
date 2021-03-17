#!/bin/bash

sudo kubectl delete namespace load
sudo kubectl create namespace load
sudo kubectl create deploy cartsloadgen --image=shinojosa/cartsloadgen:keptn -n load
