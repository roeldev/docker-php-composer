docker-php-composer
===================

[![Latest release][latest-release-img]][latest-release-url]
[![Build status][build-status-img]][build-status-url]
[![Layers][image-layers-img]][image-layers-url]
[![Image size][image-size-img]][image-size-url]

[latest-release-img]: https://img.shields.io/github/release/roeldev/docker-php-composer.svg?label=latest
[latest-release-url]: https://github.com/roeldev/docker-php-composer/releases
[build-status-img]: https://img.shields.io/docker/cloud/build/roeldev/php-composer.svg
[build-status-url]: https://hub.docker.com/r/roeldev/php-composer/builds
[image-layers-img]: https://img.shields.io/microbadger/layers/roeldev/php-composer/latest.svg
[image-layers-url]: https://microbadger.com/images/roeldev/php-composer
[image-size-img]: https://img.shields.io/microbadger/image-size/roeldev/php-composer/latest.svg
[image-size-url]: https://hub.docker.com/r/roeldev/php-composer/tags


Image with PHP 7.1 and Composer.

## Example
```
FROM roeldev/php-composer:latest as composer

COPY local/path/to/project /project/folder
WORKDIR /project/folder

RUN set -x \
    # install required php packages
 && composer install \
        --no-dev \
        --no-progress \
        --no-suggest \
        --no-interaction \
 && composer dumpautoload -o

# create actual image
FROM roeldev/php-cli:latest
COPY --from=composer /project/folder /actual/project
```

## Links
- Github: https://github.com/roeldev/docker-php-composer
- Docker hub: https://hub.docker.com/r/roeldev/php-composer
