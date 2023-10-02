# Packer Configuration

Contains packer configurations

## Folder Structure

1. Have the following folder structure for each project:

  ```bash
  project_folder:
    - scripts/script_<purpose>.sh
    - ansible/playbook.yaml
    - builder.pkr.hcl
    - plugins.pkr.hcl
    - sources.pkr.hcl
    - variables.pkr.hcl
  ```

## Important notes

1. If developing locally then make sure to run `packer init` on the project folder to ensure we installed the required plugins, see the packer block on the `ami.pkr.hcl` file.

1. Always set to `true` the `CREATE_AMI` environment variable before running `validate` and `build`, once the test goes ok set the value to `false`
1. Use the `-debug` flag in case you need to inspect each step.

## Workflow

1. Init and Verify

```bash
packer init .
packer fmt .
export SKIP_CREATE_AMI=true && packer validate -var aws_region=<aws region> .
packer validate .
```

1. Build:

```bash
export SKIP_CREATE_AMI=false && time packer build .
```
