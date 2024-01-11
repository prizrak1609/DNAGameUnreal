FROM ubuntu:22.04

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

RUN apt-get update && apt-get install -y dotnet6 ca-certificates

USER 1000:1000

COPY --chown=1000:1000 Project/Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh
