#!/bin/bash

# HOWTO
# create the file ./removed_users.txt with one username per line
# generate your token in https://github.com/settings/tokens and replace with your_token

while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    echo "processing line: ${LINE}"
    curl -X DELETE -H "Accept: application/vnd.github.v3+json" -H "Authorization: token <your_token>" https://api.github.com/orgs/<your_org>/members/${LINE}
done < ./removed_users.txt
