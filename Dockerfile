FROM ubuntu/dotnet-aspnet:6.0-22.04_stable

# Unreal Engine is located in /unreal_engine
# Sources is located in /src
# Archive directory is /archive

ARG TargetPlatform=Linux
ARG Configuration=Development
ARG ProjectName=DNAGameUnreal
ARG ArchiveDir=/archive
ARG StageDir=/tmp

ARG UnrealEnginePath
ARG SourcesPath

RUN mkdir -p /unreal_engine
RUN mkdir -p /src

USER 1000:1000

COPY $UnrealEnginePath /unreal_engine
COPY $SourcesPath /src

RUN /unreal_engine/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun \
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
