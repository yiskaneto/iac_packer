packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

locals {
  purpose = "demo"
}

source "amazon-ebs" "demo" {
  skip_create_ami      = true
  ami_name             = "PACKER-DEMO-${local.purpose}"
  ami_description      = "This is the blueprint I used to generate other AMIs"
  instance_type        = "t2.micro"
  region               = var.aws_region
  source_ami           = var.ami_id
  iam_instance_profile = "EC2_SSM"
  ssh_username         = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.purpose}"
  }
}

build {
  sources = ["source.amazon-ebs.demo"]

  provisioner "shell" {
    script = "scripts/script.sh"
  }

  provisioner "ansible" {
      playbook_file = "./playbook.yml"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}
