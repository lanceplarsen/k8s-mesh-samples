# k8s-mesh-samples-consul

## Introduction
This lab is based on the [Connect K8s sidecar](https://www.consul.io/docs/platform/k8s/connect.html) content available from HashiCorp. In this example we will configure a basic server and client, and show mutual authentication between services leveraging the Envoy proxy.

## Steps
1. Run the [lab script](lab.sh) against your cluster.

#Mutual auth example
1. Test our service

```
kubectl exec static-client -c static-client -- curl -s http://127.0.0.1:1234/
"hello world"
```

2. Add a Consul intention to deny the service. You can do this easily through the cli. To get the

```
kubectl get service # Look for the `consul-ui` external IP.
export CONSUL_HTTP_ADDR=<http://<external_ip>:80
consul intention create -deny static-client static-server
```

3. Test our service again

```
kubectl exec static-client -- curl -s http://127.0.0.1:1234/
command terminated with exit code 52
```
