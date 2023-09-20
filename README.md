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
