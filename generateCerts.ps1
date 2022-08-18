$MKCERT_CAROOT= mkcert -CAROOT

Copy-Item "$MKCERT_CAROOT/rootCA.pem" .
Copy-Item ./cacerts ./rootCA.p12
keytool -importcert -storetype PKCS12 -keystore rootCA.p12 -storepass changeit -alias rootCA -file rootCA.pem -noprompt

Push-Location ./config-ibm-fhir/resources/security
mkcert -pkcs12 -p12-file fhirKeyStore.p12 ibm-fhir localhost 127.0.0.1 ::1
Pop-Location

Push-Location ./config-keycloak
mkcert -pkcs12 -p12-file keycloak-keystore.p12 keycloak localhost 127.0.0.1 ::1
Pop-Location

Push-Location ./config-vp-server
mkcert -pkcs12 -p12-file quarkus-keystore.p12 vp-server localhost 127.0.0.1 ::1
Pop-Location
