#!/bin/bash

echo "Executing Post-API Helpers"
echo $DEFAULT_PATH
ls
ls $DEFAULT_PATH
echo $TF_VAR_environment
python3 $DEFAULT_PATH/api_helpers/python/main.py "Prod" "Noncore" $VENDED_ACCOUNT_ID