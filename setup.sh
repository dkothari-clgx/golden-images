#!/usr/bin/env bash

set -eu

BASEDIR="$( cd "$( dirname "$0" )" && pwd)"

if ! which pipenv >/dev/null; then 
  pip3 install pipenv
fi

if [[ -f .envrc ]]; then 
  cp envrc.template .envrc
  direnv allow
fi

CURR_DIR=$(PWD)
cd $BASEDIR
pipenv install
cd $CURR_DIR
