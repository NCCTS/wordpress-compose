#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

script_path () {
    local scr_path=""
    local dir_path=""
    local sym_path=""
    # get (in a portable manner) the absolute path of the current script
    scr_path=$(cd -P -- "$(dirname -- "$0")" && pwd -P) && scr_path=$scr_path/$(basename -- "$0")
    # if the path is a symlink resolve it recursively
    while [ -h $scr_path ]; do
        # 1) cd to directory of the symlink
        # 2) cd to the directory of where the symlink points
        # 3) get the pwd
        # 4) append the basename
        dir_path=$(dirname -- "$scr_path")
        sym_path=$(readlink $scr_path)
        scr_path=$(cd $dir_path && cd $(dirname -- "$sym_path") && pwd)/$(basename -- "$sym_path")
    done
    echo $scr_path
}

script_dir=$(dirname -- "$(script_path)")
cd $script_dir

curl https://wordpress.org/latest.tar.gz | tar -xzf -

cp router.php wordpress/router.php

cat wp-config.php.top > wordpress/wp-config.php
echo -e "\n$(curl https://api.wordpress.org/secret-key/1.1/salt/)\n" \
     >> wordpress/wp-config.php
cat wp-config.php.bottom >> wordpress/wp-config.php
echo >> wordpress/wp-config.php
