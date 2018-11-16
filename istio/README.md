# k8s-mesh-samples-istio

## Introduction
This lab is based on running the [Book Info](https://istio.io/docs/examples/bookinfo) application on Istio, and will build familiarity with it's features and components. In this lab we will focus on intelligent routing capabilities.

## Steps
1. Run the [lab script](lab.sh) against your cluster.

## Routing example
The Istio Bookinfo sample consists of four separate microservices, each with multiple versions. If you access the Bookinfo app’s /productpage in a browser and refresh it you'll notice that different versions of the application will serve. By default this happens in a round robin behavior.

To see this in action, we can access the application through the Istio gateway we configured in our setup script. We can get the gateway endpoint with the below command. The GKE environment supports external load balancers, so we can get to our application with the external IP.

```
kubectl get svc istio-ingressgateway -n istio-system
```

We can now configure our routing for an explicit app version.

```
kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
```

The application is now pointed at the V1 version.

# Mutual auth example
TODO

## Cleanup
There is a [clean up](cleanup.sh) script in this folder. Run the script before continuing with the additional labs.
