#!/bin/bash
istio-*/samples/bookinfo/platform/kube/cleanup.sh
kubectl delete -f istio-*/samples/bookinfo/platform/kube/rbac/ratings-policy.yaml
kubectl delete -f istio-*/samples/bookinfo/platform/kube/rbac/details-reviews-policy.yaml
kubectl delete -f istio-*/samples/bookinfo/platform/kube/rbac/productpage-policy.yaml
kubectl delete -f samples/bookinfo/platform/kube/rbac/rbac-config-ON.yaml
