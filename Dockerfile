# syntax = docker/dockerfile:experimental
FROM ubuntu:22.04 as builder

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

ARG SourcePath
ARG UnrealPath

RUN apt-get update && apt-get install -y dotnet6 ca-certificates

COPY Project/Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh

WORKDIR /tmp

RUN --mount=type=bind,source=${SourcePath},target=/src,rw \
    --mount=type=bind,source=${UnrealPath},target=/unreal_engine,rw \
    ./build.sh

FROM ubuntu:22.04

RUN mkdir /archive

COPY --from=builder /archive /archive