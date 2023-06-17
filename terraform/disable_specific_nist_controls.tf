variable "environment" {
  type = string
  default = "non-prod"
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
  aws_securityhub_standards_subscription.nist_benchmarks-eu-central-1
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
  count = var.environment != "prod" ? 1 : 0
  source = "./modules/securityhub"
  disabled_nis_control_all_region = var.disabled_nis_control_all_account_excluding_prod
  disabled_global_nis_control = var.disabled_global_nis_control
  depends_on = [ aws_securityhub_standards_subscription.nist_benchmarks-eu-west-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-1,
  aws_securityhub_standards_subscription.nist_benchmarks-us-west-2,
  aws_securityhub_standards_subscription.nist_benchmarks-us-east-2,
  aws_securityhub_standards_subscription.nist_benchmarks-ca-central-1,
  aws_securityhub_standards_subscription.nist_benchmarks-eu-central-1
]
}

