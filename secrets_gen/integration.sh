#!/bin/bash

cat << EOF > roles/k8s/files/integration.yml
apiVersion: v1
kind: Secret
metadata:
  name: public
  namespace: integration
data:
  public-key-1: $(echo -n "public-value-1" | base64)
  public-key-2: $(echo -n "public-value-2" | base64)
EOF