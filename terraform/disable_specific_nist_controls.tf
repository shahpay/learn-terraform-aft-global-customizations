variable "environment" {
  type = string
  default = "Nonprod"
}

variable "type" {
  type = string
  default = "Noncore"
}

#Disable this controls in all account except production account
variable "disabled_nis_control_all_account_excluding_prod" {
  type = map(string)
  default = {
  nis_elb_5    =     "ELB.5"
  nis_rds_19   =     "RDS.19"
  nis_rds_20   =     "RDS.20"
  nis_rds_21   =     "RDS.21"
  nis_rds_22   =     "RDS.22"
  nis_rds_7    =     "RDS.7"
  nis_rds_8    =     "RDS.8"
  nis_rds_9    =     "RDS.9"
}
}

# Disable this global control in all accounts except Core Account.  In Core Account, disable this control in all region except eu-west-1
# Global controls would be based on global resurce i.e. IAM
variable "disabled_nis_control_all_account_excluding_core_aggregrated_region" {
  type = map(string)
  default = {
  # nis_iam_6    =     "IAM.6"
}
}

# Disable this global control in all region except eu-west-1
# Global controls would be based on global resurce i.e. IAM
variable "disabled_global_nis_control" {
  type = map(string)
  default = {}
}

module securityhub_all {
  providers = {
    aws.useast2 = aws.useast2
    aws.uswest2 = aws.uswest2
    aws.cacentral1 = aws.cacentral1
    aws.eucentral1 = aws.eucentral1
    aws.euwest1 = aws.euwest1
    aws.euwest2 = aws.euwest2
    aws.euwest3 = aws.euwest3
}
  source = "./modules/securityhub"
  depends_on = [ aws_securityhub_standards_subscription.nist_benchmarks-eu-west-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-1,
  aws_securityhub_standards_subscription.nist_benchmarks-us-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-2,
  aws_securityhub_standards_subscription.nist_benchmarks-ca-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-3
  
]
}

module securityhub_excluding_production_accounts{
  providers = {
    aws.useast2 = aws.useast2
    aws.uswest2 = aws.uswest2
    aws.cacentral1 = aws.cacentral1
    aws.eucentral1 = aws.eucentral1
    aws.euwest1 = aws.euwest1
    aws.euwest2 = aws.euwest2
    aws.euwest3 = aws.euwest3
}
  count = var.environment != "Prod" ? 1 : 0
  source = "./modules/securityhub"
  disabled_nis_control_all_region = var.disabled_nis_control_all_account_excluding_prod
  disabled_global_nis_control = var.disabled_global_nis_control
  depends_on = [ aws_securityhub_standards_subscription.nist_benchmarks-eu-west-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-1,
  aws_securityhub_standards_subscription.nist_benchmarks-us-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-2,
  aws_securityhub_standards_subscription.nist_benchmarks-ca-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-3
]
}


module securityhub_excluding_core_accounts{
  providers = {
    aws.useast2 = aws.useast2
    aws.uswest2 = aws.uswest2
    aws.cacentral1 = aws.cacentral1
    aws.eucentral1 = aws.eucentral1
    aws.euwest1 = aws.euwest1
    aws.euwest2 = aws.euwest2
    aws.euwest3 = aws.euwest3
}
  count = var.type == "Core" ? 0 : 1
  source = "./modules/securityhub"
  disabled_nis_control_all_region = var.disabled_nis_control_all_account_excluding_core_aggregrated_region 
  disabled_global_nis_control = var.disabled_global_nis_control
  depends_on = [ aws_securityhub_standards_subscription.nist_benchmarks-eu-west-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-1,
  aws_securityhub_standards_subscription.nist_benchmarks-us-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-2,
  aws_securityhub_standards_subscription.nist_benchmarks-ca-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-3
]
}

module securityhub_core_accounts_excluding_global_region{
  providers = {
    aws.useast2 = aws.useast2
    aws.uswest2 = aws.uswest2
    aws.cacentral1 = aws.cacentral1
    aws.eucentral1 = aws.eucentral1
    aws.euwest1 = aws.euwest1
    aws.euwest2 = aws.euwest2
    aws.euwest3 = aws.euwest3
}
  count = var.type == "Core" ? 1 : 0
  source = "./modules/securityhub"
  disabled_nis_control_all_region = var.disabled_global_nis_control
  disabled_global_nis_control = var.disabled_nis_control_all_account_excluding_core_aggregrated_region
  depends_on = [ aws_securityhub_standards_subscription.nist_benchmarks-eu-west-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-1,
  aws_securityhub_standards_subscription.nist_benchmarks-us-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-2,
  aws_securityhub_standards_subscription.nist_benchmarks-ca-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-3
]
}

data "aws_caller_identity" "current_account" {}


resource "aws_securityhub_standards_control" "ev" {
   control_status = "DISABLED"
   disabled_reason = "We dont need it"
   standards_control_arn = "arn:aws:securityhub:eu-west-1:${data.aws_caller_identity.current_account.account_id}:control/nist-800-53/v/5.0.0/EC2.2"
}

resource "aws_securityhub_standards_control" "ec2_2" {
   control_status = "DISABLED"
   disabled_reason = "We dont need it"
   standards_control_arn = "arn:aws:securityhub:eu-west-1:${data.aws_caller_identity.current_account.account_id}:control/nist-800-53/v/5.0.0/EC2.2"
}


# module securityhub_core_accounts_excluding_global_region{
#   providers = {
#     aws.useast2 = aws.useast2
#     aws.uswest2 = aws.uswest2
#     aws.cacentral1 = aws.cacentral1
#     aws.eucentral1 = aws.eucentral1
#     aws.euwest1 = aws.euwest1
#     aws.euwest2 = aws.euwest2
#     aws.euwest3 = aws.euwest3
# }
#   count = var.environment != "Core"  ? 1 : 0
#   source = "./modules/securityhub"
#   disabled_nis_control_all_region = 
#   disabled_global_nis_control = var.disabled_nis_control_all_account_excluding_core_aggregrated_region
#   depends_on = [ aws_securityhub_standards_subscription.nist_benchmarks-eu-west-1,
#   aws_securityhub_standards_subscription.nist_benchmarks-eu-west-2,
#   aws_securityhub_standards_subscription.nist_benchmarks-us-east-1,
#   aws_securityhub_standards_subscription.nist_benchmarks-us-west-2,
#   aws_securityhub_standards_subscription.nist_benchmarks-us-east-2,
#   aws_securityhub_standards_subscription.nist_benchmarks-ca-central-1,
#   aws_securityhub_standards_subscription.nist_benchmarks-eu-central-1,
#   aws_securityhub_standards_subscription.nist_benchmarks-eu-west-3
# ]
# }


