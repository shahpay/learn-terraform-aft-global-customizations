import boto3
from utils import (
    enabled_controls_list,
    enabled_prod_list,
    enabled_core_list,
    standards_arn_prefix,
    standards_arn_suffix,
    valid_regions,
    global_region
)
import os

environment = os.environ.get("TF_VAR_environment")
type = os.environ.get("TF_VAR_type")
account_id = os.environ.get("TF_VAR_target_account")

standards_arn = f"{standards_arn_prefix}::{account_id}:{standards_arn_suffix}"

def disabled_controls():
    try:
        for region in valid_regions:
            print("--------------Region--------------", region)
            sh_client = boto3.client("securityhub", region_name=region)

            applied_all_response = apply_enabled_controls_list(
                sh_client, enabled_controls_list, region
            )
            print(applied_all_response)
            print(environment)

            if environment == "Prod":
                applied_prod_response = apply_enabled_controls_list(
                   sh_client, enabled_prod_list, region
                )
                print(applied_prod_response)

            if type == "Core" and region == global_region:
                applied_core_response = apply_enabled_controls_list(
                   sh_client, enabled_core_list, region
                )
    except Exception as e:
        print(e)


def apply_enabled_controls_list(sh_client, enabled_controls_list, region):
    batch_controls_list = []
    for key in enabled_controls_list:
        control_id = enabled_controls_list[key]
        batch_controls_list.append(
            {
                "StandardsArn": standards_arn,
                "SecurityControlId": control_id,
                "AssociationStatus": "ENABLED"
            }
        )

    print("List appended for region", region)
    print("Length of the list", len(batch_controls_list))

    response = sh_client.batch_update_standards_control_associations(
        StandardsControlAssociationUpdates=batch_controls_list
    )
    return response


if __name__ == "__main__":
    print("Script starting, calling disabled controls")

    # Function to disable controls
    disabled_controls()
    print("------------------Script ending for disabled controls---------------")

