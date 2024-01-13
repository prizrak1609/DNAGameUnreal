#!/bin/bash

set -x

export ProjectPath=$1
export Configuration=$2
export TargetPlatform=$3
export ArchiveDir=$4
export StageDir=$5

sudo chown -R builder /tmp/unreal_engine
sudo chown -R builder /tmp/src
sudo chown -R builder /tmp/archive

cd /tmp

ls -al

ls -al src

pwd

echo "/tmp/unreal_engine/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun \
            -project=$ProjectPath \
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
            -deploy"

bash /tmp/unreal_engine/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun \
            -project=$ProjectPath \
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