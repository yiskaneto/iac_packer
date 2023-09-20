# Packer Configuration

Contains packer configurations

## General rules

1. Have the following folder structure for each project:

  ```bash
  project_folder:
    - scripts/script_<purpose>.sh
    - ami.pkr.hcl
    - variables.pkr.hcl
    - playbook.yaml
  ```

1. If developing locally then make sure to run `packer init` on the project folder to ensure we installed the hashicorp/amazon required plugin, see the packer block on the `ami.pkr.hcl` file.

1. Always set to `true` the `skip_create_ami` parameter on the `amazon-ebs` block to verify everything goes fine, once we confirm all the installation goes ok set this parameter to false.

1. Use the `-debug` flag in case you need to inspect each step.
