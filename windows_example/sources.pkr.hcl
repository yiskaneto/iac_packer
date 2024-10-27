locals {
  purpose = var.purpose
  tags = {
    Env         = "ChangeMe"
    Name        = "${local.purpose}-AMI"
    Tools       = "ChangeMe"
    GeneratedBy = "Haschicorp/Packer"
  }
}

data "amazon-ami" "aws-elasticbeanstalk-amzn-latest" {
  filters = {
    name = "aws-elasticbeanstalk-amzn-2024.10.09.x86_64-WindowsServer2019-V2-hvm-2024-10-13T22-50-20.812Z" // The full name at the time when creating this image was aws-elasticbeanstalk-amzn-2024.10.09.x86_64-WindowsServer2019-V2-hvm-2024-10-13T22-50-20.812Z but it may change in the future.
  }
  owners      = ["732788773938"] // This is one fo the official Microsoft AWS Account IDs
  most_recent = true
}

source "amazon-ebs" "widnows_demo" {
  skip_create_ami = var.skip_create_ami
  source_ami      = data.amazon-ami.aws-elasticbeanstalk-amzn-latest.id
  ami_name        = "${local.purpose}-AMI"
  ami_description = "test"
  instance_type   = "t2.micro"
  region          = var.aws_region
  encrypt_boot    = true
  temporary_iam_instance_profile_policy_document {
    Statement {
      Action   = ["logs:*"]
      Effect   = "Allow"
      Resource = ["*"]
    }
    Version = "2012-10-17"
  }
  # This user data file sets up winrm and configures it so that the connection
  # from Packer is allowed. Without this file being set, Packer will not
  # connect to the instance.
  user_data_file   = "../boot_config/winrm_bootstrap.txt"
  communicator     = "winrm"
  force_deregister = true
  winrm_insecure   = true
  winrm_username   = "Administrator"
  winrm_use_ssl    = true
  subnet_filter {
    filters = {
      "tag:amiBuild" : "true"
    }
    most_free = true
    random    = false
  }
  tags = local.tags
}
