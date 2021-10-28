# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "accounts" {
  type        = list(map(string))
  description = "A list of maps specifying the details of the AWS account(s) to provision (e.g. [ {account_email = \"admin1@example.com\", account_name = \"Example Account 1\", account_org_unit = \"Sandbox\", provisioned_product_name = \"example-account-1\", sso_email = \"john.doe@example.com\", sso_first_name = \"John\", sso_last_name = \"Doe\"}, {account_email = \"admin2@example.com\", account_name = \"Example Account 2\", account_org_unit = \"Sandbox\", provisioned_product_name = \"example-account-2\", sso_email = \"john.doe@example.com\", sso_first_name = \"John\", sso_last_name = \"Doe\"} ]).  Field descriptions: account_email - the root email address to associate with the AWS account, account_name - the name of the AWS account to provision, account_org_unit - the name of the AWS Organizational Unit under which the account resides, provisioned_product_name - the name of the service catalog product that is provisioned, sso_email - the email address of the SSO user (this email address must already exist in AWS SSO), sso_first_name - the first name of the SSO user, sso_last_name - the last name of the SSO user"
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
