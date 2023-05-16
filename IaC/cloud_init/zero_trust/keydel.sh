#!/bin/bash
ACCESSTOKEN=$1

if [ -z "$ACCESSTOKEN" ] ; then
  echo "no accesstoken"
  exit 1
fi

# einlesen der ID des keys zum Loeschen
ID=$(cat /tmp/sshkey_id)

# Rest-API call zum loeschen.
curl -X DELETE --header "PRIVATE-TOKEN: $ACCESSTOKEN" "https://gitlab.com/api/v4/user/keys/$ID" 
