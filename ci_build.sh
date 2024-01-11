#!/bin/bash

docker run --rm -v $(pwd)/unreal_engine:/unreal_engine -v $(pwd)/Project:/src -v $(pwd)/archive:/archive --name dnagame_container azzulis/dnagame_build:1.3 /bin/bash -c /tmp/build.sh DNAGameUnreal Development Linux /stage /archive