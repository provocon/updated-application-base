# Java Application Base Image

This repository contains the necessary parts to create a Docker image for a
slightly enhanced version of the CoreMedia Java Application Base Image used
by CoreMedia Content Cloud (CMCC) workspaces 20nm and up.

At the time of writing - August 2023 - the intermediate image is not needed for
updating packages in the original images from CoreMedia to deal with known
vulnerabilities.

The home of this repository is at [GitHub][github] with an automated mirror at
[GitLab][gitlab].

## Feedback

Please use the [issues][issues] section of this repository at [GitHub][github]
for feedback. 

## Goals

This image is intended for use as a plug in replacement for the original
image, addressing some upgradable packages in these images.

## Availability

This image can be used via the canonical name `provocon/updated-application-base`
with the same version tag as used by [CoreMedia][coremedia] in their respective
version of the workspace.

Tags are thus named after their respective underlying releases from CoreMedia.

Find the web overview at [Docker Hub][docker]

## Usage

With CMCC-10, change the application base image in any of the pom files

```
<docker.java-application-base-image.repo>provocon/updated-application-base</docker.java-application-base-image.repo>
```

With CMCC-11, change the application base image in any of the pom files

```
<application.image-base>provocon/updated-application-base:1.2-cm-11.0-temurin-jre</application.image-base>
```

## Build

### Manual Build

Preparation of the container is accomplished using the usual

```
docker build -t <myname> .
```

So, for the current version this is

```
docker build --build-arg JAVA_APPLICATION_BASE_IMAGE_TAG=1.2-cm-11.0-temurin-jre \
 --build-arg JAVA_APPLICATION_BASE_IMAGE_REPO=coremedia/java-application-base \
 -t provocon/updated-application-base:1.2-cm-11.0-temurin-jre .
```

```
docker push provocon/updated-application-base:1.2-cm-11.0-temurin-jre
```

### Scripted Build

Alternatively, you could use the [Gradle Build Tool][gradle] and issue

```
./gradlew -Pci_version=1.2-cm-11.0-temurin-jre dockerPush
```

which does all the steps above for you.


## Test

Test the generated resulting container with

```
docker run -it --entrypoint=/bin/bash provocon/updated-application-base:1.2-cm-11.0-temurin-jre
```

[sencha]: https://www.sencha.com/products/extjs/cmd-download/
[coremedia]: https://www.coremedia.com/
[gitlabci]: https://gitlab.com/
[docker]: https://hub.docker.com/r/provocon/updated-application-base
[issues]: https://github.com/provocon/updated-application-base/issues
[github]: https://github.com/provocon/updated-application-base
[gitlab]: https://gitlab.com/provocon/updated-application-base
[maven]: https://maven.apache.org/
[gradle]: https://gradle.org/
