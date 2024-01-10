FROM azzulis/dnagame_base:1.0

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

ARG TargetPlatform=Linux
ARG Configuration=Development
ARG ProjectName=DNAGameUnreal
ARG ArchiveDir=/archive
ARG StageDir=/tmp

ARG UnrealEnginePath

USER 1000:1000

RUN --mount=type=bind,source=$UnrealEnginePath,target=/unreal_engine,rw \
     --mount=type=bind,source=.,target=/src,rw \
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
