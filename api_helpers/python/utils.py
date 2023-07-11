standards_arn_prefix = "arn:aws:securityhub"
standards_arn_suffix = "standards/nist-800-53/v/5.0.0"
valid_regions = [
    "eu-west-1",
    "eu-west-2",
    "us-east-1",
    "us-east-2",
    "us-west-2",
    "ca-central-1",
    "eu-central-1",
    "eu-west-3"
]
global_region = "eu-west-1"


enabled_controls_list = {
    "nis_ec2_10": "EC2.10",
    "nis_lambda_3": "Lambda.3",
    "nis_rds_16": "RDS.16",
    "nis_rds_17": "RDS.17"
}

enabled_prod_list = {
    "nis_ec2_6": "EC2.6",
    "nis_rds_11": "RDS.11"
}

# enabled_globals_list = {
#     "nis_iam_1": "IAM.1",
#     "nis_iam_2": "IAM.2",
#     "nis_iam_3": "IAM.3",
#     "nis_iam_4": "IAM.4",
#     "nis_iam_5": "IAM.5",
#     # "nis_iam_6": "IAM.6"
#     "nis_iam_7": "IAM.7",
#     "nis_iam_8": "IAM.8",
#     "nis_iam_9": "IAM.9",
#     "nis_iam_19": "IAM.19",
#     "nis_iam_21": "IAM.21",
#     "nis_kms_1": "KMS.1",
#     "nis_kms_2": "KMS.2",
# }
