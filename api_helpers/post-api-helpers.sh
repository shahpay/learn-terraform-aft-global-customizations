#!/bin/bash

echo "Executing Post-API Helpers"
python3 $DEFAULT_PATH/api_helpers/python/main.py 
python3 $DEFAULT_PATH/api_helpers/python/check_specific_nist_controls_status.py