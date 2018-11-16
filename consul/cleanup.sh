#!/bin/bash
helm ls --short | xargs -L1 helm delete
kubectl delete -f server.yml
kubectl delete -f client.yml
