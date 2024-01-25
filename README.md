# dirsrv
Configurable [389 Directory Server](https://www.port389.org/) Docker image.

---
 - [Overview](https://github.com/JeffersonLab/dirsrv#overview)
 - [Configure](https://github.com/JeffersonLab/dirsrv#configure)
 - [Release](https://github.com/JeffersonLab/dirsrv#release)
---

## Overview
This project provides a docker image which extends the production-oriented [389ds/dirsrv](https://hub.docker.com/r/389ds/dirsrv) and adds features for development and testing.   The extended image sets up a Docker healthcheck, installs client tools, and adds some default configuration for the Jefferson Lab environment.  Configuration is supported via environment variables and bash scripts.

## Configure

## Release
1. Create a new release on the GitHub Releases page.  The release should enumerate changes and link issues.
2. Build and publish a new Docker image.
