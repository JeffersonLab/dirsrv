# dirsrv
Configurable [389 Directory Server](https://www.port389.org/) Docker image.

---
 - [Overview](https://github.com/JeffersonLab/dirsrv#overview)
 - [Configure](https://github.com/JeffersonLab/dirsrv#configure)
 - [Release](https://github.com/JeffersonLab/dirsrv#release)
---

## Overview
This project provides a docker image which extends the production-oriented [389ds/dirsrv](https://hub.docker.com/r/389ds/dirsrv) and adds features for development and testing.   The Jefferson Lab image sets up a Docker healthcheck and Docker entrypoint, installs client tools , and adds some default configuration for the Jefferson Lab environment.  The entrypoint integrates with the healthcheck such that the container is "healthy" only when dirsrv is both running and configured.  Configuration is supported via environment variables and a conventional directory named `/docker-entrypoint-initdb.d` of bash and ldif scripts that can be overwritten by mounting a volume.

## Configure
Mount a volume at `/docker-entrypoint-initdb.d` containing bash and ldif scripts to run, ordered by name ascending.  See [example](https://github.com/JeffersonLab/dirsrv/tree/main/scripts/example/docker-entrypoint-initdb.d).

Environment variables:
| Name | Description |
|------|-------------|
| DS_DM_PASSWORD | Directory Manager password |
| DS_SUFFIX_NAME | SUFFIX to use |
| DS_BACKEND_NAME | BACKEND (optional, used in example) |

## Release
1. Create a new release on the GitHub Releases page.  The release should enumerate changes and link issues.
2. Build and publish a new Docker image.
