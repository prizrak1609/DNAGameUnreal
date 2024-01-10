FROM azzulis/dnagame_base:1.0

# Unreal Engine directory is /unreal_engine
# Sources directory is /src
# Archive directory is /archive

ARG TargetPlatform=Linux
ARG Configuration=Development
ARG ProjectName=DNAGameUnreal
ARG StageDir=/stage
ARG ArchiveDir=/archive

USER 1000:1000

COPY --chown=1000:1000 Build/build.sh /tmp

RUN chmod 755 /tmp/build.sh

CMD [ "/bin/bash", "-c", "/tmp/build.sh $ProjectName $Configuration $TargetPlatform $StageDir $ArchiveDir" ]