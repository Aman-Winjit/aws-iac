# Terraform AWS Infrastructure Management

## Description
This repository contains Terraform configurations to efficiently manage infrastructure resources on Amazon Web Services (AWS).

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS credentials configured
- [Make](https://www.gnu.org/software/make/) utility installed

## Makefile
This repository provides a Makefile with the following commands:
- `init`: Initializes Terraform within the working directory.
- `plan`: Generates a Terraform execution plan.
- `apply`: Applies Terraform configurations to create/update resources.
- `destroy`: Destroys all the resources created by Terraform.

## Command Execution
To execute Terraform commands using the Makefile, run the following:
```bash
make init
make plan
make apply
make destroy

## Variable
Ensure necessary variables are provided in the variables.tfvars and secrets.tfvars files before running the commands.

Note: Always review and understand the changes Terraform plans to apply before executing apply or destroy commands.