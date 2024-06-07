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

1. If developing locally then run the following commands to ensure the required plugins are installed (see the `packer` block on the `plugins.pkr.hcl` file whithin the project folder):
    1. `cd <project_name>`
    1. `packer init plugins.pkr.hcl`

1. Always set the value if the  `SKIP_CREATE_AMI` environment variable to `true` before running `validate` and `build`, once the test goes ok set the value to `false`
1. Use the `-debug` flag in case you need to inspect each step.

## Workflow

1. Init and Verify

```bash
time packer init .
time packer fmt .
export SKIP_CREATE_AMI=true && packer validate -var aws_region=${AWS_REGION} .
time packer validate .
```

1. Build:

```bash
export SKIP_CREATE_AMI=false && time packer build .
```
