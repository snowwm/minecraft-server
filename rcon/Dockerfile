FROM php:apache

LABEL maintainer snowwontmelt

RUN curl -L https://api.github.com/repos/ekaomk/Minecraft-RCON-Console/tarball \
  | tar xz --strip=1

COPY .htaccess .htaccess
COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]
