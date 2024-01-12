# syntax = docker/dockerfile:experimental
FROM ubuntu:22.04 as builder

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

ARG SourcePath
ARG UnrealPath

RUN apt-get update && apt-get install -y dotnet6 ca-certificates zip

COPY Project/Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh
RUN mkdir /src
RUN mkdir /unreal_engine

COPY ${SourcePath} /src
COPY ${UnrealPath} /unreal_engine

WORKDIR /unreal_engine

RUN unzip /unreal_engine/${UnrealPath} -d /unreal_engine
RUN rm /unreal_engine/${UnrealPath}

WORKDIR /tmp

RUN ./build.sh

FROM ubuntu:22.04

RUN mkdir /archive

COPY --from=builder /archive /archive