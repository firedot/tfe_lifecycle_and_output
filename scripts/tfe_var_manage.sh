# The following  block of code checks what variables are enabled for TFE Workspace

CONFIRM_DESTROY_VALUE="$(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  "${TFE}/vars?filter%5Borganization%5D%5Bname%5D=${ORG_NAME}&filter%5Bworkspace%5D%5Bname%5D=${WSPACE_NAME}" 2>/dev/null | \
  jq ' .data | .[] | select(.attributes.key == "CONFIRM_DESTROY") | .attributes.value' | \
  tr -d \" )"

if  [ ${CONFIRM_DESTROY_VALUE}  -eq  1 ] ; then
    echo "Queue destroy option is enabled"
else
    echo -e "Queue destroy option is disabled\n"
    while read -p "Do you want to enable it: Y/N " ANSWER; do
        if [ ${ANSWER} ==  'Y' ] || [ ${ANSWER} == 'y'  ]; then
             echo -e "\nThe CONFIRM_DESTROY ENV var will be set to 1 (enabled)\n"
             break
         elif [ ${ANSWER} == 'N' ] || [ ${ANSWER} == 'n' ]; then
              echo -e "\nNo changes were made.\n"
              echo -e "\nPleae note that CONFIRM_DESTROY ENV var should be enabled \n \
in  order for destroy operations to be possible\n"
              break
        else
             echo 'Invalid option'
             continue
        fi
    done
fi