#!/usr/bin/env bash

MKCERT_CAROOT=$(mkcert -CAROOT)

cp "$MKCERT_CAROOT/rootCA.pem" .
cp ./cacerts ./rootCA.p12
keytool -importcert -storetype PKCS12 -keystore rootCA.p12 -storepass changeit -alias rootCA -file rootCA.pem -noprompt

pushd ./config-ibm-fhir/resources/security > /dev/null
mkcert -pkcs12 -p12-file fhirKeyStore.p12 localhost 127.0.0.1 ::1
popd > /dev/null

pushd ./config-keycloak > /dev/null
mkcert -pkcs12 -p12-file keycloak-keystore.p12 localhost 127.0.0.1 ::1
popd > /dev/null
