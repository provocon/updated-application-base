# Java Application Base Container

This repository contains the necessary parts to create a Docker container for a 
slightly enhanced version of the CoreMedia Java Application Base Container used
by CoreMedia Content Cloud (CMCC) workspaces 20nm and up.

The home of this repository is at [github][github] with an automated mirror at
[gitlab][gitlab].

## Feedback

Please use the [issues][issues] section of this repository at [github][github] 
for feedback. 

## Goals

This container is intended for use as a plug in replacement for the original
container addressing some upgradable packages in these containers.

## Availability

This container can be used via the canonical name `provocon/updated-application-base`
with the same version tag as used by [CoreMedia][coremedia] in their respective
version of the workspace.

Tags are thus named after their respective underlying releases from CoreMedia.

## Usage

With CMCC-10 change the application base image in any of the pom files

```
<docker.java-application-base-image.repo>provocon/updated-application-base</docker.java-application-base-image.repo>
```

With CMCC-11 change the application base image in any of the pom files

```
<application.image-base>provocon/updated-application-base:2.3.1-openjdk-11-jre</application.image-base>
```

## Build

### Manual Build

Preparation of the container is accomplished using the usual

```
docker build -t <myname> .
```

So, for the current version this is

```
docker build -t provocon/updated-application-base:2.3.1-openjdk-11-jre .
```

```
docker push provocon/updated-application-base:2.3.1-openjdk-11-jre
```

### Scripted Build

Alternatively you could use the [Gradle Build Tool][gradle] and issue

```
./gradlew -Pci_version=2.3.1-openjdk-11-jre dockerPush
```

which does all the steps above for you except building the base-container.


## Test

Test the generated resulting container with

```
docker run -it --entrypoint=/bin/bash provocon/updated-application-base:2.3.1-openjdk-11-jre
```

[sencha]: https://www.sencha.com/products/extjs/cmd-download/
[coremedia]: https://www.coremedia.com/
[gitlabci]: https://gitlab.com/
[issues]: https://github.com/provocon/updated-application-base/issues
[github]: https://github.com/provocon/updated-application-base
[gitlab]: https://gitlab.com/provocon/updated-application-base
[maven]: https://maven.apache.org/
[gradle]: https://gradle.org/
