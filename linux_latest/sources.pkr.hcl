locals {
  purpose = "demo"
}

source "amazon-ebs" "demo" {
  skip_create_ami      = var.skip_create_ami
  source_ami           = var.ami_id
  ami_name             = "PACKER-DEMO-${local.purpose}"
  ami_description      = "This is the blueprint I use to generate other AMIs"
  instance_type        = "t2.micro"
  region               = var.aws_region
  security_group_id    = var.sg_id
  iam_instance_profile = "EC2_SSM"
  ssh_username         = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.purpose}"
  }
}
