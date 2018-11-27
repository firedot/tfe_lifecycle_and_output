#!/usr/bin/env bash

which curl jq || {
    apt-get update
    apt-get install -y curl jq
}
