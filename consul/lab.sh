#!/bin/bash

#Init Helm
helm init

#wait for helm to be ready
sleep 10

#Add our admin
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

#Get the chart
git clone https://github.com/hashicorp/consul-helm.git

#Install the chart
helm install -f values.yaml ./consul-helm
