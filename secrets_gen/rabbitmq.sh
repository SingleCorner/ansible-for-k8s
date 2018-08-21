#!/bin/bash

NAMESPACE=$1
PROJECT=$2
PASSWORD=$3
COOKIE=$4
SECRET=`echo -n $PASSWORD | base64`
COOKIES=`echo -n $COOKIE | base64`

cat << EOF > secret/$1/$2-rabbitmq.yml
apiVersion: v1
kind: Secret
metadata:
  name: $2
  namespace: $1
type: Opaque
data:
  # $3
  rabbitmq-password: $SECRET
  # $4
  rabbitmq-cookie: $COOKIES
EOF