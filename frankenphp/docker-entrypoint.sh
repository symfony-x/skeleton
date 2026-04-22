#!/bin/sh
set -e

if [ "$1" = "frankenphp" ] || [ "$1" = "php" ] || [ "$1" = "bin/console" ]; then
    if [ -f composer.json ] && { [ ! -d vendor ] || [ -z "$(ls -A vendor 2>/dev/null)" ]; }; then
        composer install --prefer-dist --no-progress --no-interaction
    fi

    if [ -x bin/console ]; then
        php bin/console -V
    fi

    echo "Symfony-X runtime ready."
fi

exec docker-php-entrypoint "$@"
