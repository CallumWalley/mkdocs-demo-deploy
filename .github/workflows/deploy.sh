#!/bin/bash

target=$1

function fail {
    echo "::warning title=building ${target} failed. :: $*"
    exit 1
}

echo "Building for Repo:'${target%:*}' Branch:'${target#*:}"
echo "Setting Up Directories"
rm -rf repo && mkdir -vp repo
mkdir -vp "public/${target%:*}/${target#*:}"        
echo "git clone --single-branch --branch ${target#*:} https://github.com/${target%:*} repo"
git clone --single-branch --branch ${target#*:} https://github.com/${target%:*} repo || fail "Failed to checkout https://github.com/${target%:*}/${target#*:}"
echo "::group::Installing Dependencies"
(cd repo && pip install -r requirements.txt) ||  ( fail "Failed to install dependencies.")
echo "::group::Building"
(cd repo && mkdocs build --dirty --site-dir "../public/${target%:*}/${target#*:}" ) ||  ( fail "Failed to build.")
chmod -c -R +rX "public/${target%:*}" | while read -r line; do
  echo "Invalid file permissions automatically fixed::$line"
done
