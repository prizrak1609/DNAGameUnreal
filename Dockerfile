# syntax = docker/dockerfile:experimental
FROM ubuntu:22.04

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

RUN apt-get update && apt-get install -y dotnet6 ca-certificates zip

COPY Project/Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh
RUN mkdir /src
RUN mkdir /unreal_engine

COPY Project /src

WORKDIR /tmp

RUN --mount=type=bind,source=unreal_engine_5.3.2,target=/unreal_engine ./build.sh