# Java Application Base Container

This repository contains the necessary parts to create a Docker container a 
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

This container can be used via the canonical name `provocon/updated-base-image`.
The tag `latest` should be expected to usable for the latest release by 
[CoreMedia][coremedia].

Tags are named after their respective underlying releases from CoreMedia.

## Build

### Manual Build

Preparation of the container is accomplished using the usual

```
docker build -t <myname> .
```

So, for the current version this is

```
docker build -t provocon/updated-base-image:2007.1 .
docker build -t provocon/updated-base-image:2007 .
docker build -t provocon/updated-base-image:latest .
```

```
docker push provocon/updated-base-image:2007.1
docker push provocon/updated-base-image:2007
docker push provocon/updated-base-image:latest
```

### Scripted Build

Alternatively you could use the [Gradle Build Tool][gradle] and issue

```
gradle -PbuildTag=2007.1  dockerPush
gradle -PbuildTag=2007    dockerPush
gradle -PbuildTag=latest dockerPush
```

which does all the steps above for you except building the base-container.


## Test

Test the generated resulting container with

```
docker run -it --entrypoint=/bin/bash provocon/updated-base-image:2.2.1-openjdk-11-jre
```

[sencha]: https://www.sencha.com/products/extjs/cmd-download/
[coremedia]: https://www.coremedia.com/
[gitlabci]: https://gitlab.com/
[issues]: https://github.com/provocon/updated-base-image-docker/issues
[github]: https://github.com/provocon/updated-base-image-docker
[gitlab]: https://gitlab.com/provocon/updated-base-image-docker
[maven]: https://maven.apache.org/
[gradle]: https://gradle.org/
