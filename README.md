# dirsrv [![Docker](https://img.shields.io/docker/v/jeffersonlab/dirsrv?sort=semver&label=DockerHub)](https://hub.docker.com/r/jeffersonlab/dirsrv)
Configurable [389 Directory Server](https://www.port389.org/) Docker image.

---
 - [Overview](https://github.com/JeffersonLab/dirsrv#overview)
 - [Quick Start with Compose](https://github.com/JeffersonLab/dirsrv#quick-start-with-compose) 
 - [Configure](https://github.com/JeffersonLab/dirsrv#configure)
 - [Release](https://github.com/JeffersonLab/dirsrv#release)
---

## Overview
This project provides a docker image which extends the production-oriented [389ds/dirsrv](https://hub.docker.com/r/389ds/dirsrv) and adds features for development and testing.   The Jefferson Lab image sets up a Docker healthcheck and Docker entrypoint, installs client tools , and adds some default configuration for the Jefferson Lab environment.  The entrypoint integrates with the healthcheck such that the container is "healthy" only when dirsrv is both running and configured.  Configuration is supported via environment variables and a conventional directory named `/docker-entrypoint-initdb.d` of bash and ldif scripts that can be overwritten by mounting a volume.

## Quick Start with Compose
1. Grab project
```
git clone https://github.com/JeffersonLab/dirsrv
cd dirsrv
```
2. Launch [Compose](https://github.com/docker/compose)
```
docker compose up
```
3. Query for user jdoe
```
docker exec dirsrv ldapsearch -D "cn=Directory Manager" -w password -H ldap://localhost:3389 -x -b cn=users,cn=accounts,dc=example,dc=com uid=jdoe
```

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
1. [Publish to DockerHub](https://github.com/JeffersonLab/dirsrv/actions/workflows/docker-publish.yml) GitHub Action should run automatically. 
1. Bump and commit quick start [image version](https://github.com/JeffersonLab/dirsrv/blob/main/docker-compose.override.yml).
