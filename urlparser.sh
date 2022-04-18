#!/bin/bash

input="$(</dev/stdin)"

mkdir -p parsed
mkdir -p parsed/new

printf '%s\n' "$input" | ag -v "\.(jpg|jpeg|png|css|gif|svg|woff|woff2|ttf|eot|ico)($|\?)" | unfurl -u format %d%p | anew parsed/endpoints > parsed/new/endpoints
printf '%s\n' "$input" | unfurl -u domains
printf '%s\n' "$input" | unfurl -u keys | anew parsed/params > parsed/new/params
printf '%s\n' "$input" | unfurl -u values | anew parsed/values
printf '%s\n' "$input" | unfurl -u keypairs | anew parsed/pvs

