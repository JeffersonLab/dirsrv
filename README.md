# dirsrv
Configurable [389 Directory Server](https://www.port389.org/) Docker image.

---
 - [Overview](https://github.com/JeffersonLab/dirsrv#overview)
 - [Configure](https://github.com/JeffersonLab/dirsrv#configure)
 - [Release](https://github.com/JeffersonLab/dirsrv#release)
---

## Overview
This project provides a docker image which extends the production-oriented [389ds/dirsrv](https://hub.docker.com/r/389ds/dirsrv) and adds features for development and testing.   The Jefferson Lab image sets up a Docker healthcheck and Docker entrypoint, installs client tools , and adds some default configuration for the Jefferson Lab environment.  The entrypoint integrates with the healthcheck such that the container is "healthy" only when dirsrv is both running and configured.  Configuration is supported via environment variables and a directory of bash scripts that can be overwritten by mounting a volume.

## Configure

## Release
1. Create a new release on the GitHub Releases page.  The release should enumerate changes and link issues.
2. Build and publish a new Docker image.
