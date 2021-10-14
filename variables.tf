# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "account_email" {
  type        = string
  description = "The root email address to associate with the AWS account (e.g. admin@example.com)."
}

variable "account_name" {
  type        = string
  description = "The name of the AWS account to provision (e.g. Example Account)."
}

variable "account_org_unit" {
  type        = string
  description = "The name of the AWS Organizational Unit under which the account resides (e.g. Sandbox)."
}

variable "sso_email" {
  type        = string
  description = "The email address of the SSO user (e.g. john.doe@example.com).  This email address must already exist in AWS SSO."
}

variable "sso_first_name" {
  type        = string
  description = "The first name of the SSO user (e.g. John)."
}

variable "sso_last_name" {
  type        = string
  description = "The last name of the SSO user (e.g. Doe)."
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

variable "provisioned_product_name" {
  type        = string
  description = "Name of the service catalog product that is provisioned. If not provided, defaults to a slugified version of the account name. (e.g. Example_Account)."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
