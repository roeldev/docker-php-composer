docker-php-composer
===================

[![Latest release][latest-release-img]][latest-release-url]
[![Travis build status][travis-build-img]][travis-build-url]
[![Docker build status][docker-build-img]][docker-build-url]
[![Docker Hub downloads][docker-pulls-img]][docker-pulls-url]

[latest-release-img]: https://img.shields.io/github/release/roeldev/docker-php-composer.svg?label=latest
[latest-release-url]: https://github.com/roeldev/docker-php-composer/releases
[travis-build-img]: https://img.shields.io/travis/roeldev/docker-php-composer.svg
[travis-build-url]: https://travis-ci.org/roeldev/docker-php-composer
[docker-build-img]: https://img.shields.io/docker/cloud/build/roeldev/php-composer.svg
[docker-build-url]: https://hub.docker.com/r/roeldev/php-composer
[docker-pulls-img]: https://img.shields.io/docker/pulls/roeldev/php-composer.svg
[docker-pulls-url]: https://hub.docker.com/r/roeldev/php-composer


An image with PHP and Composer, based on Alpine Linux with S6 overlay. Can be used as builder image by using Composer to install dependencies etc. and copying the result to the final image, or as a base image for you own custom images.


# Versions

| Image | PHP | Composer | Info |
|-------|-----|----------|------|
| [roeldev/php-composer:7.1-latest][docker-tags-url] | 7.1.28 | 1.8.6 | [![mb-71-img]][mb-71-url]
| [roeldev/php-composer:7.2-latest][docker-tags-url] | 7.2.17 | 1.8.6 | [![mb-72-img]][mb-72-url]
| [roeldev/php-composer:7.3-latest][docker-tags-url] | 7.3.4 | 1.8.6 | [![mb-73-img]][mb-73-url]
| [roeldev/php-composer:7.4-rc-latest][docker-tags-url] | 7.4.0alpha1 | 1.8.6 | [![mb-74-img]][mb-74-url]

[docker-tags-url]: https://hub.docker.com/r/roeldev/php-composer/tags
[mb-71-img]: https://images.microbadger.com/badges/image/roeldev/php-composer:7.1-latest.svg
[mb-71-url]: https://microbadger.com/images/roeldev/php-composer:7.1-latest
[mb-72-img]: https://images.microbadger.com/badges/image/roeldev/php-composer:7.2-latest.svg
[mb-72-url]: https://microbadger.com/images/roeldev/php-composer:7.2-latest
[mb-73-img]: https://images.microbadger.com/badges/image/roeldev/php-composer:7.3-latest.svg
[mb-73-url]: https://microbadger.com/images/roeldev/php-composer:7.3-latest
[mb-74-img]: https://images.microbadger.com/badges/image/roeldev/php-composer:7.4-rc-latest.svg
[mb-74-url]: https://microbadger.com/images/roeldev/php-composer:7.4-rc-latest


# Usage

## Builder image
```
ARG PHP_VERSION="7.3"
FROM roeldev/php-composer:${PHP_VERSION} as builder

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
FROM roeldev/php-cli:${PHP_VERSION}
COPY --from=builder /project/folder /actual/project
```


## Links
- GitHub: https://github.com/roeldev/docker-php-composer
- Docker Hub: https://hub.docker.com/r/roeldev/php-composer
- Composer: https://getcomposer.org/
- Packagist: https://packagist.org/


## License
[GPL-3.0+](LICENSE) © 2019 [Roel Schut](https://roelschut.nl)
