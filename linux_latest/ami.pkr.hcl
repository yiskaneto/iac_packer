packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

locals {
    app_name = "httpd"
}

source "amazon-ebs" "httpd" {
  skip_create_ami = true
  ami_name        = "PACKER-DEMO-${local.app_name}"
  instance_type   = "t2.micro"
  region          = var.aws_region
  source_ami      = "${var.ami_id}"
  ssh_username    = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]

  provisioner "shell" {
    script = "scripts/script.sh"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}
