variable "PARAM" {
  type = string
}

module securityhub_all {
  providers = {
    aws.useast2 = aws.useast2
    aws.uswest2 = aws.uswest2
    aws.cacentral1 = aws.cacentral1
    aws.eucentral1 = aws.eucentral1
    aws.euwest1 = aws.euwest1
    aws.euwest2 = aws.euwest2
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