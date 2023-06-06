data "aws_region" "current" {}

resource "aws_securityhub_standards_subscription" "nist_benchmarks" {
  provider = aws.euwest2
  standards_arn = "arn:aws:securityhub:${data.aws_region.current.name}::standards/nist-800-53/v/5.0.0"
}
