
# List of NIS Controls to be disabled globally
variable "disabled_nis_control_all_region" {
  type = map(string)
  default = {
    nis_apigateway_3       = "APIGateway.3"
    nis_apigateway_4       = "APIGateway.4"
    nis_apigateway_9       = "APIGateway.9"
    nis_autoscaling_1      = "AutoScaling.1"
    nis_autoscaling_2      = "AutoScaling.2"
    nis_autoscaling_4      = "AutoScaling.4"
    nis_autoscaling_6      = "AutoScaling.6"
    nis_autoscaling_9      = "AutoScaling.9"
    nis_cloudformation_1   = "CloudFormation.1"
    nis_cloudtrail_1       = "CloudTrail.1"
    nis_dynamodb_1         = "DynamoDB.1"
    nis_dynamodb_2         = "DynamoDB.2"
    nis_ec2_17             = "EC2.17"
    nis_ecr_1              = "ECR.1"
    nis_ecr_3              = "ECR.3"
    nis_ecs_12             = "ECS.12"
    nis_efs_2              = "EFS.2"
    nis_elasticbeanstalk_1 = "ElasticBeanstalk.1"
    nis_elb_10             = "ELB.10"
    nis_elb_12             = "ELB.12"
    nis_elb_13             = "ELB.13"
    nis_elb_14             = "ELB.14"
    nis_elb_7              = "ELB.7"
    nis_elb_9              = "ELB.9"
    nis_es_4               = "ES.4"
    nis_es_6               = "ES.6"
    nis_es_7               = "ES.7"
    nis_lambda_5           = "Lambda.5"
    nis_networkfirewall_6  = "NetworkFirewall.6"
    nis_opensearch_6       = "Opensearch.6"
    nis_rds_13             = "RDS.13"
    nis_rds_14             = "RDS.14"
    nis_rds_15             = "RDS.15"
    nis_rds_24             = "RDS.24"
    nis_rds_25             = "RDS.25"
    nis_rds_5              = "RDS.5"
    nis_redshift_3         = "Redshift.3"
    nis_s3_10              = "S3.10"
    nis_s3_11              = "S3.11"
    nis_s3_13              = "S3.13"
    nis_sns_2              = "SNS.2"
    nis_dynamodb_4         = "DynamoDB.4"
    nis_ec2_28             = "EC2.28"
    nis_elb_16             = "ELB.16"
    nis_rds_26             = "RDS.26"
    nis_s3_14              = "S3.14"
    nis_s3_15              = "S3.15"
    nis_s3_7               = "S3.7"
    # nis_ec2_6              =     "EC2.6"
    # nis_rds_11             =     "RDS.11"
    # nis_lambda_3           = "Lambda.3"
    # nis_ec2_10 = "EC2.10"
    # nis_rds_16            =     "RDS.16"
    # nis_rds_17            =     "RDS.17"
  }
}


# Disable the following global controls in all region except eu-west-1
# Global controls would be based on global resources i.e. IAM, KMS
variable "disabled_global_nis_control" {
  type = map(string)
  default = {
    nis_iam_1  = "IAM.1"
    nis_iam_2  = "IAM.2"
    nis_iam_3  = "IAM.3"
    nis_iam_4  = "IAM.4"
    nis_iam_5  = "IAM.5"
    nis_iam_7  = "IAM.7"
    nis_iam_8  = "IAM.8"
    nis_iam_9  = "IAM.9"
    nis_iam_19 = "IAM.19"
    nis_iam_21 = "IAM.21"
    nis_kms_1  = "KMS.1"
    nis_kms_2  = "KMS.2"
  }
}





# # List of NIS Controls to be disabled globally
# variable disabled_nis_control_all_region {
#   type = map(string)
#   default = {
#     nis_apigateway_3       =   "APIGateway.3"
#     nis_apigateway_4       =   "APIGateway.4"
#     nis_apigateway_9       =   "APIGateway.9"
#     nis_autoscaling_1      =   "AutoScaling.1"
#     nis_autoscaling_2      =   "AutoScaling.2"
#     nis_autoscaling_4      =   "AutoScaling.4"
#     nis_autoscaling_6      =   "AutoScaling.6" 
#     nis_autoscaling_9      =   "AutoScaling.9"
#     nis_cloudformation_1   =   "CloudFormation.1"  
#     nis_dynamodb_1         =   "DynamoDB.1"
#     nis_dynamodb_2         =   "DynamoDB.2"
#     nis_ec2_10             =   "EC2.10"
#     nis_ec2_6              =   "EC2.6"
#     nis_ecr_1              =   "ECR.1"
#     nis_ecr_3              =   "ECR.3"
#     nis_ecs_12             =   "ECS.12"
#     nis_efs_2              =   "EFS.2"
#     nis_elasticbeanstalk_1 =   "ElasticBeanstalk.1"
#     nis_elb_10             =   "ELB.10"
#     nis_elb_12             =   "ELB.12"
#     nis_elb_13             =   "ELB.13"
#     nis_elb_14             =   "ELB.14"
#     nis_elb_7              =   "ELB.7"
#     nis_elb_9              =   "ELB.9"
#     nis_es_4               =   "ES.4"
#     nis_es_6               =   "ES.6"
#     nis_es_7               =   "ES.7"
#     nis_lambda_5           =   "Lambda.5"
#     nis_networkfirewall_6  =   "NetworkFirewall.6"
#     nis_opensearch_6       =   "Opensearch.6"
#     nis_rds_11             =   "RDS.11"
#     nis_rds_13             =   "RDS.13"
#     nis_rds_14             =   "RDS.14"
#     nis_rds_15             =   "RDS.15"
#     nis_rds_16             =   "RDS.16"
#     nis_rds_17             =   "RDS.17"
#     nis_rds_24             =   "RDS.24"
#     nis_rds_25             =   "RDS.25"
#     nis_rds_5              =   "RDS.5"
#     nis_redshift_3         =   "Redshift.3"
#     nis_s3_10              =   "S3.10"
#     nis_s3_13              =   "S3.13"
#     nis_sns_2              =   "SNS.2"
#     nis_dynamodb_4         =   "DynamoDB.4"
#     nis_ec2_28             =   "EC2.28"
#     nis_elb_16             =   "ELB.16"
#     nis_lambda_3           =   "Lambda.3"
#     nis_rds_26             =   "RDS.26"
#     nis_s3_14              =   "S3.14"
#     nis_s3_15              =   "S3.15"
#     nis_s3_7               =   "S3.7"
# }
# }


# # Disable this global controls in all region except eu-west-1
# # Global controls would be based on global resurce i.e. IAM, KMS
# variable "disabled_global_nis_control" {
#   type = map(string)
#   default = {
#   nis_iam_1               =   "IAM.1"
#   nis_iam_2               =   "IAM.2"
#   nis_iam_3               =   "IAM.3"
#   nis_iam_4               =   "IAM.4"
#   nis_iam_5               =   "IAM.5"
#   nis_iam_6               =   "IAM.6"
#   nis_iam_7               =   "IAM.7"
#   nis_iam_8               =   "IAM.8"
#   nis_iam_9               =   "IAM.9"
#   nis_iam_19              =   "IAM.19"
#   nis_iam_21              =   "IAM.21"
#   nis_kms_1               =   "KMS.1"
#   nis_kms_2               =   "KMS.2"
# }
# }


# variable enabled_nis_control_prod{
#   type = map(string)
#   default = {
#     nis_apigateway_3       =   "APIGateway.3"
#     nis_apigateway_4       =   "APIGateway.4"
#     nis_apigateway_9       =   "APIGateway.9"
#     nis_autoscaling_1      =   "AutoScaling.1"
#     nis_autoscaling_2      =   "AutoScaling.2"
#     nis_autoscaling_4      =   "AutoScaling.4"
#     nis_autoscaling_6      =   "AutoScaling.6" 
#     nis_autoscaling_9      =   "AutoScaling.9"
#     nis_cloudformation_1   =   "CloudFormation.1"  
#     nis_dynamodb_1         =   "DynamoDB.1"
#     nis_dynamodb_2         =   "DynamoDB.2"
#     nis_ec2_10             =   "EC2.10"
#     nis_ec2_6              =   "EC2.6"
#     nis_ecr_1              =   "ECR.1"
#     nis_ecr_3              =   "ECR.3"
#     nis_ecs_12             =   "ECS.12"
#     nis_efs_2              =   "EFS.2"
#     nis_elasticbeanstalk_1 =   "ElasticBeanstalk.1"
#     nis_elb_10             =   "ELB.10"
#     nis_elb_12             =   "ELB.12"
#     nis_elb_13             =   "ELB.13"
#     nis_elb_14             =   "ELB.14"
#     nis_elb_7              =   "ELB.7"
#     nis_elb_9              =   "ELB.9"
#     nis_es_4               =   "ES.4"
#     nis_es_6               =   "ES.6"
#     nis_es_7               =   "ES.7"
#     nis_lambda_5           =   "Lambda.5"
#     nis_networkfirewall_6  =   "NetworkFirewall.6"
#     nis_opensearch_6       =   "Opensearch.6"
#     nis_rds_11             =   "RDS.11"
#     nis_rds_13             =   "RDS.13"
#     nis_rds_14             =   "RDS.14"
#     nis_rds_15             =   "RDS.15"
#     nis_rds_16             =   "RDS.16"
#     nis_rds_17             =   "RDS.17"
#     nis_rds_24             =   "RDS.24"
#     nis_rds_25             =   "RDS.25"
#     nis_rds_5              =   "RDS.5"
#     nis_redshift_3         =   "Redshift.3"
#     nis_s3_10              =   "S3.10"
#     nis_s3_13              =   "S3.13"
#     nis_sns_2              =   "SNS.2"
#     nis_dynamodb_4         =   "DynamoDB.4"
#     nis_ec2_28             =   "EC2.28"
#     nis_elb_16             =   "ELB.16"
#     nis_lambda_3           =   "Lambda.3"
#     nis_rds_26             =   "RDS.26"
#     nis_s3_14              =   "S3.14"
#     nis_s3_15              =   "S3.15"
#     nis_s3_7               =   "S3.7"
# }
# }

# variable disabled_nis_control_exclude_prod_all_region {
# type = map(string)
# default = {
#   nis_elb_5    =     "ELB.5"
#   nis_rds_19   =     "RDS.19"
#   nis_rds_20   =     "RDS.20"
#   nis_rds_21   =     "RDS.21"
#   nis_rds_22   =     "RDS.22"
#   nis_rds_7    =     "RDS.7"
#   nis_rds_8    =     "RDS.8"
#   nis_rds_9    =     "RDS.9"
# }
# }




