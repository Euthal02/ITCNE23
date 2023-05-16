#!/bin/bash
ACCESSTOKEN=$1

if [ -z "$ACCESSTOKEN" ] ; then
  echo "no accesstoken"
  exit 1
fi

# create keys
rm -f /tmp/gitlabkey 2> /dev/null
ssh-keygen -t rsa -N "" -f /tmp/gitlabkey
sed 's/^/    /g' /tmp/gitlabkey > /tmp/gitlabkey.mod

# push public key to gitlab
CURL_OUTPUT=$(curl -X POST --header "PRIVATE-TOKEN: $ACCESSTOKEN" \
     --header "Content-Type: application/json" \
     --data '{ "title": "zerotrust", "usage_type": "auth", "key": "'"$(cat /tmp/gitlabkey.pub)"'" }' \
     "https://gitlab.com/api/v4/user/keys")

SSHKEY_ID=$(echo "$CURL_OUTPUT" | grep -Po '[0-9]{8}')
echo "$SSHKEY_ID" > /tmp/sshkey_id
