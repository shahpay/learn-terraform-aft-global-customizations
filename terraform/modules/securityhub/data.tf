data "aws_region" "us-east-1" {}

data "aws_region" "us-east-2" {
  provider = aws.useast2
}

data "aws_region" "us-west-2" {
  provider = aws.uswest2
}

data "aws_region" "ca-central-1" {
  provider = aws.cacentral1
}

data "aws_region" "eu-central-1" {
  provider = aws.eucentral1
}

data "aws_region" "eu-west-1" {
  provider = aws.euwest1
}

data "aws_region" "eu-west-2" {
  provider = aws.euwest2
}

data "aws_region" "eu-west-3" {
  provider = aws.euwest3
}


data "aws_caller_identity" "current_account" {}