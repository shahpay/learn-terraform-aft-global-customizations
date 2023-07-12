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

enabled_core_list = {
    "nis_iam_6": "IAM.6"
}
