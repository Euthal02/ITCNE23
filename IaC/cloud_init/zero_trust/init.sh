#!/bin/bash
cd "$(dirname "$0")" || exit

ACCESSTOKEN=$(gpg -d gitlab_key.gpg)
./keygen.sh "$ACCESSTOKEN"
./overwrite_user-data.sh
./vm_launch.sh
./keydel.sh "$ACCESSTOKEN"
