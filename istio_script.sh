#!/bin/bash

#Give ourselves cluster admin (for GKE)
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)

#Get the istio release
curl -L https://git.io/getLatestIstio | sh -

#install istio
cd istio-1.0.3
echo "Installing resource definitions"
kubectl apply -f install/kubernetes/helm/istio/templates/crds.yaml
echo "Installing Istio with mutual auth"
kubectl apply -f install/kubernetes/istio-demo-auth.yaml

#Deploy the sample app
echo "Deploying sample app"
kubectl label namespace default istio-injection=enabled
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml
