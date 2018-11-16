#!/bin/bash
istio-*/samples/bookinfo/platform/kube/cleanup.sh
kubectl delete -f istio-*/install/kubernetes/helm/istio/templates/crds.yaml -n istio-system
kubectl delete -f istio-*/install/kubernetes/istio-demo-auth.yaml
kubectl delete -f istio-*/samples/bookinfo/platform/kube/rbac/ratings-policy.yaml
kubectl delete -f istio-*/samples/bookinfo/platform/kube/rbac/details-reviews-policy.yaml
kubectl delete -f istio-*/samples/bookinfo/platform/kube/rbac/productpage-policy.yaml
kubectl delete -f istio-*/samples/bookinfo/platform/kube/rbac/rbac-config-ON.yaml
