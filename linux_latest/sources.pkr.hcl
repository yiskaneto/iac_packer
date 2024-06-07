locals {
  purpose = var.purpose
}

data "amazon-ami" "al2023" {
  filters = {
    name = "al2023-ami-2023*-kernel-*-x86_64" // Amazon Linux 2023
  }
  owners      = ["137112412989"] // Official AWS account
  most_recent = true
}

source "amazon-ebs" "demo" {
  skip_create_ami      = var.skip_create_ami
  source_ami           = data.amazon-ami.al2023.id
  ami_name             = "${local.purpose}-AMI"
  ami_description      = "Custom AMI using Linux 2023 with some extra tools I usually use to check other AWS services"
  instance_type        = "t2.micro"
  region               = var.aws_region
  encrypt_boot         = true
  temporary_iam_instance_profile_policy_document {
    Statement {
        Action   = ["logs:*"]
        Effect   = "Allow"
        Resource = ["*"]
    }
    Version = "2012-10-17"
  }
  ssh_username         = "ec2-user"
  tags = {
    Env   = "Dev"
    Name  = "${local.purpose}-AMI"
    Tools = "psql"
  }
}
