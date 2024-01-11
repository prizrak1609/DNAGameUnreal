#!/bin/bash

ProjectName=$1
Configuration=$2
TargetPlatform=$3
StageDir=$4
ArchiveDir=$5

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