# k8s-mesh-samples-istio

## Introduction
This lab is based on running the [Book Info](https://istio.io/docs/examples/bookinfo) application on Istio, and will build familiarity with it's features and components. In this lab we will focus on intelligent routing capabilities.

## Steps
1. Run the [lab script](lab.sh) against your cluster.

## Intelligent routing example
The Istio Bookinfo sample consists of four separate microservices, each with multiple versions. If you access the Bookinfo app’s /productpage in a browser and refresh it you'll notice that different versions of the application will serve. By default this happens in a round robin behavior.

To see this in action, we can access the application through the Istio gateway we configured in our setup script. We can get the gateway endpoint with the below command. The GKE environment supports external load balancers, so we can get to our application with the external IP.

```
kubectl get svc istio-ingressgateway -n istio-system
```

We can now configure our routing for an explicit app version. We will configure the v2 ratings service so we can use it later.

```
kubectl apply -f virtual-service-all.yaml
```

The application is now using the v2 ratings version app.

## Service auth example
You can specify authentication requirements for services receiving requests in an Istio mesh using authentication policies. We can demonstrate this with BookInfo sample app.

1. We will create our service accounts for the microservices.

```
kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo-add-serviceaccount.yaml)
```

2. We will enable RBAC in the cluster.

```
kubectl apply -f samples/bookinfo/platform/kube/rbac/rbac-config-ON.yaml
```

3. We will allow access to the Product Page. We will enable this for all users in the clusters. We can check the application at this point to see it does not have access to any services.

```
kubectl apply -f samples/bookinfo/platform/kube/rbac/productpage-policy.yaml
```

4. We will enable access to the details, reviews. and rating services. Check the application between each of these steps to see the incremental behavior.

```
kubectl apply -f samples/bookinfo/platform/kube/rbac/details-reviews-policy.yaml
kubectl apply -f samples/bookinfo/platform/kube/rbac/ratings-policy.yaml
```

## Cleanup
There is a [clean up](cleanup.sh) script in this folder. Run the script before continuing with the additional labs.
