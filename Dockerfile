ARG PHP_VERSION="7.1"
FROM roeldev/php-cli:${PHP_VERSION}-latest
ENV COMPOSER_ALLOW_SUPERUSER=1

# install dependencies
RUN set -x \
 && apk add --no-cache \
        git \
        unzip \
 # download composer installer
 && curl -fLs \
    --retry 3 \
    --output /tmp/composer-installer.php \
    --url https://getcomposer.org/installer \
 && curl -fLs \
    --retry 3 \
    --output /tmp/composer-signature.sig \
    --url https://composer.github.io/installer.sig \
 # verify installer signature
 && php -r " \
        \$sig = trim(file_get_contents('/tmp/composer-signature.sig')); \
        \$hash = hash('sha384', file_get_contents('/tmp/composer-installer.php')); \
        if (!hash_equals(\$sig, \$hash)) { \
          echo 'ERROR: Invalid composer installer signature.' . PHP_EOL; \
          exit(1); \
        }" \
 # install composer
 && php /tmp/composer-installer.php \
    --quiet \
    --install-dir=/usr/local/bin \
    --filename=composer

ENV PATH=/root/.composer/vendor/bin:$PATH
