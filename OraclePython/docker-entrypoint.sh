#!/usr/bin/env bash

set -e

if [ "$1" = "server" ]
then
    echo "Run app with app.env=${APP_ENV}"
	python3 src/main.py
else
	eval "$@"
fi