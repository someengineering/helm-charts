#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cd charts/resoto

NEW_FILE="$(helm-docs --dry-run)"
OLD_FILE="$(cat README.md)"

printf "Printing new readme..... \n\n\n\n"
echo "$NEW_FILE"

printf "\n\n\n\n"

printf "Printing old readme..... \n\n\n\n\n"
echo "$OLD_FILE"

if [ "$NEW_FILE" == "$OLD_FILE" ]; then
    echo "Strings are equal."
    exit 0
else
    echo "Strings are not equal."
    exit 1
fi
