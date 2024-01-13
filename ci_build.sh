#!/bin/bash

docker run --name dn_game_container --rm -v ./unreal_engine:/unreal_engine -v ./Project:/src -v ./archive:/archive azzulis/dnagame_build:2.0 /bin/bash /tmp/build.sh DNAProject Shipping Linux /archive