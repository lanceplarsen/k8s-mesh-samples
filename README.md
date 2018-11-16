# k8s-mesh-samples

Service mesh labs for K8s, Istio, and Consul training.
- [envoy](envoy)
- [istio](istio)
- [consul](consul)
----

## Prerequisites
These samples can run with any K8s distro but were designed around GKE. A GKE K8s cluster and service account will be provided for you in this session. The inputs will be provided to you by the trainer for below commands.

1.  Install the [gcloud sdk](https://cloud.google.com/sdk/docs/quickstarts) on your machine.

2.  Install kubectl with gcloud.

```
gcloud components install kubectl
```

3. Install [Helm](https://docs.helm.sh/using_helm).

2.  Authenticate to the GCP training project

```
gcloud auth activate-service-account <training_account> --key-file=<training_key_file>
```

3.  Connect to your K8s cluster

```
gcloud container clusters get-credentials <cluster_name> --zone <training_zone> --project <training_project>
```

## Instructions
See the README in each individual lab as instructed.
