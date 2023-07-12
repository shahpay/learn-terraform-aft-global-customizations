import boto3
import json
from utils import (
    enabled_controls_list,
    enabled_prod_list,
    enabled_globals_list,
    standards_arn_prefix,
    standards_arn_suffix,
    valid_regions,
    global_region,
)
import os
import sys


environment = sys.argv[0]
type = sys.argv[1]
account_id = sys.argv[2]

print(environment)
print(type)
print(account_id)


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

            if environment == "Prod":
                applied_prod_response = apply_enabled_controls_list(
                   sh_client, enabled_prod_list, region
                )
                print(applied_prod_response)


            # if region == global_region:
            #     applied_global_response = apply_enabled_controls_list(
            #         sh_client, enabled_global_list, region
            #     )


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

