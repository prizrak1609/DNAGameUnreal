#!/bin/bash

docker run --name dna_game_container --rm -v unreal_engine_5.3.2:/tmp/unreal_engine -v $(pwd)/Project:/tmp/src -v $(pwd)/archive:/tmp/archive azzulis/dnagame_build:2.5 /bin/bash /tmp/build.sh DNAProject Shipping Linux /tmp/archive /tmp/stage