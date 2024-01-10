FROM ubuntu:22.04

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

RUN apt-get update && apt-get install -y dotnet6 ca-certificates

RUN mkdir /unreal_engine
RUN mkdir /src
