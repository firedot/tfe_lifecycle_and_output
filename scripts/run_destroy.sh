#!/usr/bin/env bash

# Create a payload file

INPUT_FILE="/vagrant/templates/payload_template"
OUTPUT_FILE="/tmp/payload.json"

cat $INPUT_FILE | sed "s/WSPACE/"${WSPACE_ID}"/g; s/CONF/"${CONF}"/g; s/false/true/g" > ${OUTPUT_FILE}

# The following block of code is for debugging purposes only, it will be removed in the final version
#cat ${OUTPUT_FILE} | grep "${WSPACE_ID}" > /dev/null

if cat ${OUTPUT_FILE} | grep "${WSPACE_ID}" > /dev/null; then
    echo -e "SUCCESS: Your payload file was created \n"
else
    echo -e "FAILURE: Something went wrong \n"
fi

# The following block of code is going to create a new run within your TFE Workspace

curl \
  --header "Authorization: Bearer ${TOKEN}" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @${OUTPUT_FILE} \
  ${TFE}/runs 2>/dev/null | jq '.data | .id' | tr -d \" > /tmp/new_tfe_run_id

NEW_TFE_RUN="$(cat /tmp/new_tfe_run_id)"

# The following is added for debugging purposes. Will be removed in the final version
echo -e "Your New Run ID is: \n "${NEW_TFE_RUN}" \n"

# The following block of code will apply your last created run

# NOTE!!! There should be some check to verify that the previous operation (plan) has ended.
# Otherwise the apply operation will not run.

echo "waiting 1 minute for the plan to finish"
for x in {1..30}; do
  echo -n
  sleep 2
done
echo 'Running the apply block'

curl \
  --header "Authorization: Bearer ${TOKEN}" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @${OUTPUT_FILE} \
  ${TFE}/runs/${NEW_TFE_RUN}/actions/apply


echo -e "\n OPERATION COMPLETE \n"

