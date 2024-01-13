FROM ubuntu:22.04

# Unreal Engine directory is /unreal_engine_<version>
# Sources directory is /src
# Archive directory is /archive

RUN apt-get update && apt-get install -y dotnet6 ca-certificates zip

RUN mkdir /stage

COPY Project/Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh

USER root
