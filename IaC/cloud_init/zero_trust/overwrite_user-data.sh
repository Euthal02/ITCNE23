#!/bin/bash

sed '/SSH-KEY-PLACE/r /tmp/gitlabkey.mod' "$(dirname "$0")"/user-data-template.yaml | sed '/SSH-KEY-PLACE/d'> /tmp/user-data.yml
