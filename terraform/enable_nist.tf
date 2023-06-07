# module "security_group_us_east_1" {
#   source   = "./modules/security-hub"

#   providers = {
#     aws = aws.sts-root
#   }
# }

# module "security_group_us_east_2" {
#   source   = "./modules/security-hub"

#   providers = {
#     aws = aws.useast2
#   }
# }

# module "security_group_us_west_2" {
#   source   = "./modules/security-hub"

#   providers = {
#     aws = aws.uswest2
#   }
# }

# module "security_group_ca_central_1" {
#   source   = "./modules/security-hub"

#   providers = {
#     aws = aws.cacentral1
#   }
# }

# module "security_group_eu_central_1" {
#   source   = "./modules/security-hub"

#   providers = {
#     aws = aws.eucentral1
#   }
# }

# module "security_group_eu_west_1" {
#   source   = "./modules/security-hub"

#   providers = {
#     aws = aws.euwest1
#   }
# }

# module "security_group_eu_west_2" {
#   source   = "./modules/security-hub"

#   providers = {
#     aws = aws.euwest2
#   }
# }

# data "aws_region" "us-east-1" {
#     provider = aws.sts-root
# }

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

# resource "aws_securityhub_standards_subscription" "nist_benchmarks-us-east-1"  {
#   provider = aws.sts-root
#   standards_arn = "arn:aws:securityhub:${data.aws_region.us-east-1.name}::standards/nist-800-53/v/5.0.0"
# }

resource "aws_securityhub_standards_subscription" "nist_benchmarks-us-east-2" {
  provider = aws.useast2
  standards_arn = "arn:aws:securityhub:${data.aws_region.us-east-2.name}::standards/nist-800-53/v/5.0.0"
}

resource "aws_securityhub_standards_subscription" "nist_benchmarks-us-west-2" {
  provider = aws.uswest2
  standards_arn = "arn:aws:securityhub:${data.aws_region.us-west-2.name}::standards/nist-800-53/v/5.0.0"
}

resource "aws_securityhub_standards_subscription" "nist_benchmarks-ca-central-1"{
  provider = aws.cacentral1
  standards_arn = "arn:aws:securityhub:${data.aws_region.ca-central-1.name}::standards/nist-800-53/v/5.0.0"
}

resource "aws_securityhub_standards_subscription" "nist_benchmarks-eu-central-1" {
  provider = aws.eucentral1
  standards_arn = "arn:aws:securityhub:${data.aws_region.eu-central-1.name}::standards/nist-800-53/v/5.0.0"
}

resource "aws_securityhub_standards_subscription" "nist_benchmarks-eu-west-1" {
  provider = aws.euwest1
  standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-1.name}::standards/nist-800-53/v/5.0.0"
}

resource "aws_securityhub_standards_subscription" "nist_benchmarks-eu-west-2" {
  provider = aws.euwest2
  standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-2.name}::standards/nist-800-53/v/5.0.0"
}











# data "aws_region" "us-east-1" {
#     provider = aws.sts-root
# }

# data "aws_region" "us-east-2" {
#     provider = aws.useast2
# }

# data "aws_region" "us-west-2" {
#     provider = aws.uswest2
# }

# data "aws_region" "ca-central-1" {
#     provider = aws.cacentral1
# }

# data "aws_region" "eu-central-1" {
#     provider = aws.eucentral1
# }

# data "aws_region" "eu-west-1" {
#     provider = aws.euwest1
# }

# data "aws_region" "eu-west-2" {
#     provider = aws.euwest2
# }

# resource "aws_securityhub_standards_subscription" {
#   provider = aws.sts-root
#   standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-1.name}::standards/nist-800-53/v/5.0.0"
# }

# resource "aws_securityhub_standards_subscription" "nist_benchmarks" {
#   provider = aws.useast2
#   standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-2.name}::standards/nist-800-53/v/5.0.0"
# }

# resource "aws_securityhub_standards_subscription" "nist_benchmarks-euwest1" {
#   provider = aws.uswest2
#   standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-1.name}::standards/nist-800-53/v/5.0.0"
# }

# resource "aws_securityhub_standards_subscription" {
#   provider = aws.cacentral1
#   standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-1.name}::standards/nist-800-53/v/5.0.0"
# }

# resource "aws_securityhub_standards_subscription" {
#   provider = aws.cacentral1
#   standards_arn = "arn:aws:securityhub:${data.aws_region.eu-west-1.name}::standards/nist-800-53/v/5.0.0"
# }
