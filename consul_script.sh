#!/bin/bash

#Init Helm
helm init

#Add our admin
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

#Get the chart
git clone https://github.com/hashicorp/consul-helm.git

#Install the chart
helm install -f values.yaml ./consul-helm

#Install our dummy application
kubectl create -f server.yml
kubectl create -f client.yml
