#!/bin/bash

docker run --name dna_game_container --rm -v unreal_engine_5.3.2:/tmp/unreal_engine -v ./Project:/tmp/src -v ./archive:/tmp/archive azzulis/dnagame_build:2.2 /bin/bash /tmp/build.sh DNAProject Shipping Linux /tmp/archive /tmp/stage