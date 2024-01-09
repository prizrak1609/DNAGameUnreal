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

ARG UnrealEnginePath

RUN echo $UnrealEnginePath

RUN mkdir /unreal_engine
RUN mkdir /src

COPY --chown=1000:1000 $UnrealEnginePath /unreal_engine
COPY --chown=1000:1000 . /src
