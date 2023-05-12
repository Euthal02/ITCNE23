#!/bin/bash

multipass launch -n securevm --cloud-init /tmp/user-data.yml
