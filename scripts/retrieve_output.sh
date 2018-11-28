#!/usr/bin/env bash

LOG_READ_URL="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  "${TFE}/runs/${CURRENT_RUN}/apply" 2>/dev/null | jq '.data.attributes."log-read-url"' | tr -d \")"

RETRIEVED_OUTPUT="curl  ${LOG_READ_URL}"

${RETRIEVED_OUTPUT}


