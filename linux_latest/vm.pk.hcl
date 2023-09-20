source "amazon-ebs" "httpd" {
  ami_name      = "PACKER-DEMO-${local.app_name}"
  instance_type = "t2.micro"
  region        = var.aws_region
  source_ami    = "${var.ami_id}"
  ssh_username  = "ec2-user"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]

  provisioner "shell" {
    script = "script/script.sh"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}
