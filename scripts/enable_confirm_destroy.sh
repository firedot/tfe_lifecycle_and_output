#!/usr/bin/env bash


# Create a payload file

INPUT_FILE="/vagrant/templates/payload_var_template"
OUTPUT_FILE="/tmp/payload_var.json"

WSPACE_ID="$(curl \
   --header "Authorization: Bearer ${TOKEN}" \
   --header "Content-Type: application/vnd.api+json" \
   ${TFE}/organizations/${ORG_NAME}/workspaces/${WSPACE_NAME} 2>/dev/null | jq '.data | .id' | tr -d \")"

cat $INPUT_FILE | sed "s/WSPACE/${WSPACE_ID}/g"  > ${OUTPUT_FILE}

# The following block of code is for debugging purposes only, it will be removed in the final version

if cat ${OUTPUT_FILE} | grep "${WSPACE_ID}" > /dev/null; then
    echo -e "SUCCESS: Your payload file was created \n"
else
    echo -e "FAILURE: Something went wrong \n"
fi



# Execute the following command to create an ENV var in your workspace named CONFIRM_DESTROY with a value of 1
echo ${TFE}
echo ${WSPACE_ID}
echo ${TOKEN}

curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @/tmp/payload_var.json \
  ${TFE}/vars | jq '.data | .key, .value'

# Check if the procedure was successful


CHECK_VALUE="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  "${TFE}/vars?filter%5Borganization%5D%5Bname%5D=${ORG_NAME}&filter%5Bworkspace%5D%5Bname%5D=${WSPACE_NAME}" 2>/dev/null | \
  jq ' .data | .[] | select(.attributes.key == "CONFIRM_DESTROY") | .attributes.value' | \
  tr -d \")"

echo ${CHECK_VALUE}
if [[ ${CHECK_VALUE} == 1 ]]; then
    echo -e 'SUCCESS: CONFIRM_DESTROY is now set to 1 (enabled)'
else
    echo -e 'FAILURE: Oooops! Something went wrong!'
fi
