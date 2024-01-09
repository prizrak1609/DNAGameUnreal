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

COPY ${UnrealEnginePath} /unreal_engine
COPY ${SourcesPath} /src

RUN /unreal_engine/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun \
    -project=/src/${ProjectName}.uproject \
    -build \
    -configuration=${Configuration} \
    -targetplatform=${TargetPlatform} \
    -cook \
    -unversionedcookedcontent \
    -stage \
    -stagingdirectory=${StageDir} \
    -pak \
    -compressed \
    -prereqs \
    -archive \
    -archivedirectory=${ArchiveDir} \
    -archivemetadata \
    -package \
    -allmaps \
    -utf8output \
    -buildmachine \
    -unattended \
    -noP4 \
    -nosplash \
    -stdout \
    -NoCodeSign \
    -separatedebuginfo \
    -deploy
