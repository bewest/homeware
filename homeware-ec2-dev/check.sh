#!/bin/bash

CERT=${1-}
PKEY=${2-}

if [[ -z $CERT || -z $PKEY ]] ; then
  echo "Usage: ${0} CERT PKEY"
  echo ""
  exit 1;
fi

openssl x509 -modulus -in $CERT
openssl rsa -modulus -in $PKEY


#####
# EOF
