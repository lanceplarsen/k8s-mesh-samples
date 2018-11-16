# k8s-mesh-samples-envoy


## Introduction
This lab is based on the [getting started](https://www.envoyproxy.io/docs/envoy/latest/start/start) content available from Envoy. We will build a simple static configured example proxy before diving in to Envoy implementations in service mesh solutions.

## Steps

1. [Install Docker](https://store.docker.com/search?type=edition&offering=community) if not on your system.
2. Build the Docker container.

```
docker build -t envoy:v1 .
```

3. Run the Docker container.

```
docker run -d --name envoy -p 9901:9901 -p 10000:10000 envoy:v1
```

4. Test the proxy.

```
curl -v localhost:10000
```

## Additional Discussion
See [this](https://www.envoyproxy.io/docs/envoy/latest/start/sandboxes/front_proxy) for a more advanced proxy example.
