from utils import (
    disabled_controls_list,
    disabled_globals_list,
    valid_regions
)
import boto3
import os

account_id = os.environ.get("TF_VAR_target_account")


def check_if_controls_are_disabled():
    try:
        for region in valid_regions:
            print("--------------Region--------------", region)
            sh_client = boto3.client("securityhub", region_name=region)

            standards_arn = f"arn:aws:securityhub:{region}:{account_id}:subscription/nist-800-53/v/5.0.0"
            paginator = sh_client.get_paginator("describe_standards_controls")
            starting_token = None
            next_token = 1
            dis_controls = []

            while next_token != None:
                response_iterator = paginator.paginate(
                    StandardsSubscriptionArn=standards_arn,
                    PaginationConfig={
                        "MaxItems": "100",
                        "PageSize": "100",
                        "StartingToken": starting_token,
                    },
                )

                for response in response_iterator:
                    next_token = (
                        response["NextToken"] if "NextToken" in response else None
                    )
                    controls = response["Controls"]
                    for control in controls:
                        # print(control)
                        # print("control=----------------------")
                        if control["ControlStatus"] == "DISABLED":
                            # print(control)
                            # print("disabledcontrol=----------------------")
                            dis_controls.append(control["StandardsControlArn"])
                    # print(next_token)
                    starting_token = next_token

            print(len(dis_controls))

            # print(json.dumps(dis_controls, indent = 4))
            controls_arn_prefix = f"arn:aws:securityhub:{region}:{account_id}:control/nist-800-53/v/5.0.0/"
            unsuccessful_applied = []
            unsuccessful_global_applied = []
            for key in disabled_controls_list:
                controls_arn = f"{controls_arn_prefix}{disabled_controls_list[key]}"
                if controls_arn not in dis_controls:
                    unsuccessful_applied.append(disabled_controls_list[key])

            for key in disabled_globals_list:
                controls_arn = f"{controls_arn_prefix}{disabled_globals_list[key]}"
                if controls_arn not in dis_controls:
                    unsuccessful_global_applied.append(disabled_globals_list[key])

            print("Unsuccessful controls applied", unsuccessful_applied)
            print("Unsuccessful global controls applied", unsuccessful_global_applied)
    except Exception as e:
        print(e)


if __name__ == "__main__":
    print("Script starting, checking if controls are disabled")

    # Function to check if controls were disabled
    check_if_controls_are_disabled()

    print("------------------Script ending---------------")