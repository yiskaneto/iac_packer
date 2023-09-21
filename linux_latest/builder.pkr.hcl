build {
  sources = ["source.amazon-ebs.demo"]

  provisioner "shell" {
    script = "scripts/script.sh"
  }

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
    use_proxy = false
    // use_proxy Will be come to false in the future for now we need to manually set it to false otherwise Ansible won't be able to reach the host.
    // see https://developer.hashicorp.com/packer/integrations/hashicorp/ansible/latest/components/provisioner/ansible#configuration-reference
  }

  post-processor "shell-local" {
    inline = ["echo foo"]
  }
}
