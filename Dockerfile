FROM debian:slim-bullseye

RUN set -eux; \
  export DEBIAN_FRONTEND=noninteractive; \
  apt update; \
  apt install --yes --no-install-recommends openssl libc6; \
  apt clean autoclean; \
  apt autoremove --yes; \
  rm -rf /var/lib/{apt,dpkg,cache,log}/;

COPY proksi /app/proksi

WORKDIR /app

EXPOSE 80 443

ENTRYPOINT ["/app/proksi"]