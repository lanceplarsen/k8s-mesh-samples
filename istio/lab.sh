#!/bin/bash

#Give ourselves cluster admin (for GKE)
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)

#Get the istio release
curl -L https://git.io/getLatestIstio | sh -

#install istio
echo "Installing istio resource definitions"
kubectl apply -f istio-*/install/kubernetes/helm/istio/templates/crds.yaml
echo "Installing Istio with mutual auth"
kubectl apply -f istio-*/install/kubernetes/istio-demo-auth.yaml

#Deploy the sample app
echo "Deploying sample app"
echo "Setting up Istio injection"
kubectl label namespace default istio-injection=enabled
echo "Launching book info app"
kubectl apply -f istio-*/samples/bookinfo/platform/kube/bookinfo.yaml
echo "Configuring ingress gateway"
kubectl apply -f istio-*/samples/bookinfo/networking/bookinfo-gateway.yaml
echo "Adding routting rules"
kubectl apply -f istio-*/samples/bookinfo/networking/destination-rule-all-mtls.yaml
