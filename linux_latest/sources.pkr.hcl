locals {
  purpose = var.purpose
}

source "amazon-ebs" "demo" {
  skip_create_ami      = var.skip_create_ami
  source_ami           = var.ami_id
  ami_name             = "${local.purpose}-AMI"
  ami_description      = "Linux 2023 with some tools I usually use for check other services"
  instance_type        = "t2.micro"
  region               = var.aws_region
  security_group_id    = var.sg_id
  encrypt_boot         = true
  iam_instance_profile = "EC2_SSM"
  ssh_username         = "ec2-user"
  tags = {
    Env   = "Dev"
    Name  = "${local.purpose}-AMI"
    Tools = "psql"
  }
}
