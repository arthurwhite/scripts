#!/bin/bash

# Remove useless files and reset permissions in a Laravel project, for LAMP hosting

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Remove useless files
find $SCRIPTPATH -maxdepth 1 \
	-name .editorconfig \
	-o -name .gitattributes* \
	-o -name .github* \
	-o -name .gitignore* \
	-o -name .styleci.yml \
	-o -name .travis* \
	-o -name .user.ini \
	-o -name "package*.json" \
	-o -name *.markdown \
	-o -name *.md \
	-o -name *.rst \
	-o -name *eslint* \
	-o -name AUTHOR* \
	-o -name CHANGE* \
	-o -name CONTRIBUT* \
	-o -name deploy_rsa \
	-o -name docker-compose* \
	-o -name Dockerfile \
	-o -name LICENSE* \
	-o -name phpunit.xml \
	-o -name phpunit.xml \
	-o -name README* \
	-o -name webpack.mix.js \
	-exec rm -rf {} +

# Reset rights
find $SCRIPTPATH -type f -exec chmod 640 {} +
find $SCRIPTPATH -type d -exec chmod 2750 {} +

# Reset executables
for FILE in \
	$SCRIPTPATH/laravelcleanup.sh \
	$SCRIPTPATH/artisan \
	$SCRIPTPATH/vendor/bin/carbon \
	$SCRIPTPATH/vendor/bin/commonmark \
	$SCRIPTPATH/vendor/bin/patch-type-declarations \
	$SCRIPTPATH/vendor/bin/php-parse \
	$SCRIPTPATH/vendor/bin/phpunit \
	$SCRIPTPATH/vendor/bin/psysh \
	$SCRIPTPATH/vendor/bin/var-dump-server \
	$SCRIPTPATH/vendor/league/commonmark/bin/commonmark \
	$SCRIPTPATH/vendor/nesbot/carbon/bin/carbon \
	$SCRIPTPATH/vendor/nikic/php-parser/bin/php-parse \
	$SCRIPTPATH/vendor/phpunit/phpunit/phpunit \
	$SCRIPTPATH/vendor/psy/psysh/bin/psysh \
	$SCRIPTPATH/vendor/sebastian/resource-operations/build/generate.php \
	$SCRIPTPATH/vendor/symfony/error-handler/Resources/bin/extract-tentative-return-types.php \
	$SCRIPTPATH/vendor/symfony/error-handler/Resources/bin/patch-type-declarations \
	$SCRIPTPATH/vendor/symfony/var-dumper/Resources/bin/var-dump-server
do
	chmod 750 $FILE
done

# Reset storage writing
chmod 2770 $SCRIPTPATH/public/storage
chmod -R g+w $SCRIPTPATH/storage
