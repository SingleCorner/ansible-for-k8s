#!/bin/bash

NAMESPACE=$1
PROJECT=$2
PASSWORD=$3
SECRET=`echo -n $PASSWORD | base64`

cat << EOF > secret/$1/$2-redis.yml
apiVersion: v1
kind: Secret
metadata:
  name: $2
  namespace: $1
type: Opaque
data:
  # $3
  redis-password: $SECRET
EOF