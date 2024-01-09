FROM ubuntu:22.04

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

ARG TargetPlatform=Linux
ARG Configuration=Development
ARG ProjectName=DNAGameUnreal
ARG ArchiveDir=/archive
ARG StageDir=/tmp

ARG UnrealEnginePath
ARG SourcesPath

RUN apt-get update && apt-get install -y dotnet6 ca-certificates

WORKDIR /

RUN mkdir unreal_engine
RUN mkdir src

USER 1000:1000

RUN echo $UnrealEnginePath
RUN echo $SourcesPath

COPY /$UnrealEnginePath /unreal_engine
COPY $SourcesPath /src
