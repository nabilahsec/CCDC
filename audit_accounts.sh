#!/bin/bash

echo "===== SYSTEM ACCOUNTS (<1000) WITH SHELLS ====="
sudo egrep -v "root|nologin|false|halt|shutdown|sync" /etc/passwd | \
awk -F: '($3 < 1000) {print $1 ":" $7}'

echo
echo "===== NON-SYSTEM ACCOUNTS (>=1000) ====="
sudo egrep -v "^\+" /etc/passwd | \
awk -F: '($3 >= 1000) {print $1 ":" $7}'
