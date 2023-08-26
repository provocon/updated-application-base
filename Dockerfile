#
# Copyright 2020-2023 Provocon.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
ARG JAVA_APPLICATION_BASE_IMAGE_TAG
ARG JAVA_APPLICATION_BASE_IMAGE_REPO
FROM ${JAVA_APPLICATION_BASE_IMAGE_REPO}:${JAVA_APPLICATION_BASE_IMAGE_TAG}
# This might result in minor updates to fix security vulnerabilities
USER root
RUN apt update && apt -yq upgrade && apt -yq autoremove && apt clean && (cd /var ; rm -f $(find -name "*-old")) && rm -rf /opt/java/openjdk/man/ja* /opt/java/openjdk/NOTICE /opt/java/openjdk/legal
