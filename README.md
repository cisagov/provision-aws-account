# provision-aws-account #

[![GitHub Build Status](https://github.com/cisagov/provision-aws-account/workflows/build/badge.svg)](https://github.com/cisagov/provision-aws-account/actions)

This repository contains Terraform code for provisioning new AWS accounts
via [Control Tower](https://aws.amazon.com/controltower/).

## Pre-requisites ##

- Administrative access to an AWS account that can run Control Tower.
- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [`backend.tf`](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [`backend.tf`](backend.tf)).
- A Terraform [variables](variables.tf) file customized for your new
  AWS account, for example:

  ```console
  account_email    = "admin@example.com"
  account_name     = "Example Account"
  account_org_unit = "Sandbox"
  sso_email        = "john.doe@example.com"
  sso_first_name   = "John"
  sso_last_name    = "Doe"
  ```

## Usage ##

1. Create an AWS profile called `provision-aws-account` (if you haven't
   already done so) in your AWS configuration using the
   "AWSAdministratorAccess" credentials (access key ID, secret access key,
   and session token) as obtained from the AWS account where you want
   Control Tower to run:

   ```console
   [provision-aws-account]
   aws_access_key_id = <MY_ACCESS_KEY_ID>
   aws_secret_access_key = <MY_SECRET_ACCESS_KEY>
   aws_session_token = <MY_SESSION_TOKEN>
   ```

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`.
1. Create a `<workspace_name>.tfvars` file with all of the required
   variables (see [Inputs](#Inputs) below for details).
1. Run the command `terraform init`.
1. Provision the new AWS account by running the command:

   ```console
   terraform apply -var-file=<workspace_name>.tfvars
   ```

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| controltower | ~> 1.0 |

## Providers ##

| Name | Version |
|------|---------|
| controltower | ~> 1.0 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [controltower_aws_account.account](https://registry.terraform.io/providers/idealo/controltower/latest/docs/resources/aws_account) | resource |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_email | The root email address to associate with the AWS account (e.g. admin@example.com). | `string` | n/a | yes |
| account\_name | The name of the AWS account to provision (e.g. Example Account). | `string` | n/a | yes |
| account\_org\_unit | The name of the AWS Organizational Unit under which the account resides (e.g. Sandbox). | `string` | n/a | yes |
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| provisioned\_product\_name | Name of the service catalog product that is provisioned. If not provided, defaults to a slugified version of the account name. (e.g. Example\_Account). | `string` | n/a | yes |
| sso\_email | The email address of the SSO user (e.g. john.doe@example.com).  This email address must already exist in AWS SSO. | `string` | n/a | yes |
| sso\_first\_name | The first name of the SSO user (e.g. John). | `string` | n/a | yes |
| sso\_last\_name | The last name of the SSO user (e.g. Doe). | `string` | n/a | yes |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| account | The AWS account created by Control Tower. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
