build {
  sources = ["source.amazon-ebs.demo"]

  provisioner "shell" {
    script = "scripts/script.sh"
  }

  provisioner "ansible" {
      playbook_file = "ansible/playbook.yml"
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}
