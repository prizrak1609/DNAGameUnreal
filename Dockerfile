FROM base

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

USER 1000:1000

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
