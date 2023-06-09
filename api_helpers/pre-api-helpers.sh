#!/bin/bash

echo "Executing Pre-API Helpers"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

production_ou=Production
get_accounts_recursive() {
  accounts="$(aws organizations list-accounts-for-parent --parent-id "$production_ou" --output text --query 'Accounts[][Id]')"
  for ou in $(aws organizations list-organizational-units-for-parent --parent-id "$production_ou" --output text --query 'OrganizationalUnits[][Id]'); do
    accounts="$accounts $(get_accounts_recursive "$ou")"
  done
  echo "$accounts" | xargs
}

get_accounts_recursive
