#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cd someengineering/fixinventory

NEW_FILE="$(helm-docs --dry-run)"
OLD_FILE="$(cat README.md)"

printf "Printing new readme..... \n\n\n\n"
echo "$NEW_FILE"

printf "\n\n\n\n"

printf "Printing old readme..... \n\n\n\n\n"
echo "$OLD_FILE"

if [ "$NEW_FILE" == "$OLD_FILE" ]; then
    echo "files have been updated or no change."
    exit 0
else
    echo "file needs to be updated, please run helm-docs"
    exit 1
fi
