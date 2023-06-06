data "aws_region" "eu-west-2" {
    provider = aws.euwest2
}

data "aws_region" "eu-west-1" {
    provider = aws.euwest1
}

data "aws_caller_identity" "current" {}

resource "aws_securityhub_standards_subscription" "nist_benchmarks" {
  provider = aws.euwest2
  standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-2.name}::standards/nist-800-53/v/5.0.0"
}

resource "aws_securityhub_standards_subscription" "nist_benchmarks-euwest1" {
  provider = aws.euwest1
  standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-1.name}::standards/nist-800-53/v/5.0.0"
}

resource "aws_securityhub_standards_control" "preventthis" {
  provider = aws.euwest1
  standards_control_arn = "arn:aws:securityhub:${data.aws_region.eu-west-1.name}:${data.aws_caller_identity.current.account_id}:control/cis-aws-foundations-benchmark/v/1.2.0/2.3"
  control_status        = "DISABLED"
  disabled_reason       = "We handle password policies within Okta"
}