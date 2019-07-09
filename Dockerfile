ARG PHP_VERSION="7.1"
FROM roeldev/php-cli:${PHP_VERSION}-v1

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    PATH="/root/.composer/vendor/bin:$PATH"

# install dependencies
RUN set -x \
 && apk update \
 && apk add \
    --no-cache \
        git \
        unzip \
 # install composer
 && /usr/local/bin/install_composer.sh \
 # remove composer installer
 && rm -rf /etc/composer/
