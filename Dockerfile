FROM ubuntu:22.04

# Archive directory is /archive

ARG TargetPlatform=Linux
ARG Configuration=Development
ARG ProjectName=DNAGameUnreal
ARG ArchiveDir=/archive
ARG StageDir=/tmp

ARG UnrealEnginePath
ARG SourcesPath

RUN apt-get update && apt-get install -y dotnet6 ca-certificates

USER 1000:1000

RUN --mount=type=bind,source=$UnrealEnginePath,target=/unreal_engine,readwrite \
    --mount=type=bind,source=$SourcesPath,target=/src,readwrite \
    /unreal_engine/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun \
    -project=/src/$ProjectName.uproject \
    -build \
    -configuration=$Configuration \
    -targetplatform=$TargetPlatform \
    -cook \
    -unversionedcookedcontent \
    -stage \
    -stagingdirectory=$StageDir \
    -pak \
    -compressed \
    -prereqs \
    -archive \
    -archivedirectory=$ArchiveDir \
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
