#!/bin/sh
set -e

ADMIN_USER=${ADMIN_USER:-admin}
AUTH_FILE=/var/www/.htpasswd

htpasswd -bc $AUTH_FILE $ADMIN_USER $ADMIN_PASSWORD

replace () {
   file=$1
   var=$2
   new_value=$3
   sed -i "s/^\($var\s*=\s*\).*;$/\1\"$new_value\";/" "$file"
}

RCON_HOST=${RCON_HOST:-127.0.0.1}

replace config.php \$rconHost $RCON_HOST
replace config.php \$rconPort ${RCON_PORT:-25575}
replace config.php \$rconPassword $RCON_PASSWORD
replace config.php \$queryHost ${QUERY_HOST:-$RCON_HOST}
replace config.php \$queryPort ${QUERY_PORT:-25585}

exec apache2-foreground
