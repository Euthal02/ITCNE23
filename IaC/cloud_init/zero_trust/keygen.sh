#!/bin/bash
ACCESSTOKEN='glpat-L4YEJpykNmie63EW9N6G'

# create keys
ssh-keygen -t rsa -N "" -f /tmp/gitlabkey
sed 's/^/    /g' /tmp/gitlabkey > /tmp/gitlabkey.mod

# push public key to gitlab
curl -X POST --header "PRIVATE-TOKEN: $ACCESSTOKEN" \
     --header "Content-Type: application/json" \
     --data '{ "title": "zerotrust", "usage_type": "auth", "key": "'"$(cat /tmp/gitlabkey.pub)"'" }' \
     --output /tmp/curl.out \
     "https://gitlab.com/api/v4/user/keys"
