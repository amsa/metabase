#! /usr/bin/env bash

project_root=`pwd`

rm -rf resources/modules
mkdir resources/modules

lein clean
lein install-with-tests

cd modules/driver/sqlite

lein clean
lein with-profile +with-test-extensions uberjar

cp target/uberjar/sqlite.metabase-driver.jar "$project_root/resources/modules/"

cd "$project_root"
