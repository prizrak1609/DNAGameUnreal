FROM ubuntu:22.04

# Unreal Engine directory is /tmp/unreal_engine_<version>
# Sources directory is /tmp/src
# Archive directory is /tmp/archive

RUN apt-get update && apt-get install -y dotnet6 ca-certificates zip sudo

RUN useradd -ms /bin/bash builder
RUN usermod -aG sudo builder
RUN echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER builder

COPY --chown=builder Project/Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh
