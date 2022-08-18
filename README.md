# FHIR Vaccination Pass Infrastructure
This repository contains a complete Docker Compose setup for
a deployment of the FHIR Vaccination Pass application.

## Prerequisites
- Docker & Docker-Compose
- [mkcert](https://github.com/FiloSottile/mkcert)

## Getting Started
Run the following (requires administrator privileges on Windows):
```shell script
mkcert -install
```

### MacOS and Linux:
Then run:
```shell script
./generateCerts.sh
```

### Windows:
Then run:
```shell script
.\generateCerts.ps1
```

## Running the stack
You can run the entire stack:

```bash
docker compose up
```

Or individual services:

```bash
docker compose up ibm-fhir keycloak
```

The FHIR Server can take a long time to start (ca. 5 minutes),
be patient and trust the health checks!
