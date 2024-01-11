FROM azzulis/dnagame_base:1.0

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

USER 1000:1000

COPY --chown=1000:1000 Project/Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh
