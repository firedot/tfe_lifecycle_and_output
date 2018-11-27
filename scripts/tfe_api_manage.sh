#!/usr/bin/env bash

read -p 'Please enter your organization name: ' ORG_NAME
read -p 'Please enter your workspace name: ' WSPACE_NAME
read -p 'Please enter your API user token: ' TOKEN

export ORG_NAME=${ORG_NAME}
export WSPACE_NAME=${WSPACE_NAME}
export TOKEN=${TOKEN}
export TFE=https://app.terraform.io/api/v2

echo -e "\nPlease choose an operation from the list below: \n \
    1) Run and apply operation \n \
    2) \n \
    3) \n \
    4) \n \
\n \
    Please enter a number in the range 1-4 that corresponds to your choice or enter 5 to exit \n \
   "
read -p 'Please choose option 1-4, or 5 to exit: ' CHOICE

case ${CHOICE} in
    "1") echo -e "\nYou chose a run and apply operationi \n"
         bash /vagrant/scripts/run_plan_apply.sh;;
    "5") echo -e "\nGoodbye! Please have a nice day.\n";;


esac
