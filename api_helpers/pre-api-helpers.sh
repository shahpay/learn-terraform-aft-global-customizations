# #!/bin/bash

# echo "Executing Pre-API Helpers"

# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

# # production_ou=Production
# get_accounts_recursive() {
#   accounts="$(aws organizations list-accounts-for-parent --parent-id "Production" --output text --query 'Accounts[][Id]')"
#   for ou in $(aws organizations list-organizational-units-for-parent --parent-id "$production_ou" --output text --query 'OrganizationalUnits[][Id]'); do
#     accounts="$accounts $(get_accounts_recursive "$ou")"
#   done
#   echo "$accounts" | xargs
# }

# get_accounts_recursive

echo "Executing Pre-API Helpers"
echo "Rescan github.com public SSH key"
echo "Ref: https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/"
echo "End of Removing AWS Profile"
echo "Begin of getting parameter"

environment=`aws ssm get-parameter --name "/aft/account-request/custom-fields/environment" --query 'Parameter.Value' --output text`
type=`aws ssm get-parameter --name "/aft/account-request/custom-fields/type" --query 'Parameter.Value' --output text`
echo $environment
if [ "$environment" != "Prod" ]; then
	environment="Nonprod"
fi

if [ "$type" != "Core" ]; then
  type="Noncore"
fi

echo "After the if"
echo $environment
echo $type
echo "export TF_VAR_environment=\"$environment"\" >> $DEFAULT_PATH/aft-venv/bin/activate
echo "export TF_VAR_type=\"$type"\" >> $DEFAULT_PATH/aft-venv/bin/activate
echo "export TF_VAR_target_account=\"$VENDED_ACCOUNT_ID"\" >> $DEFAULT_PATH/aft-venv/bin/activate
export TF_VAR_PARAM=$param

# echo $TF_VAR_PARAM >> $DEFAULT_PATH/aft-venv/bin/activate
# echo "End of getting parameter"
# echo "Begin of changing file permissions"
# chmod 400 /tmp/github_dtpl_terraform_modules_key
# echo "End of changing file permissions"
# echo "export GIT_SSH_COMMAND=\"ssh -o IdentitiesOnly=yes -i /tmp/github_dtpl_terraform_modules_key\"" >> $DEFAULT_PATH/aft-venv/bin/activate
# echo "Returning target profile"
# export AWS_PROFILE=$AWS_PROFILE_ORIG

