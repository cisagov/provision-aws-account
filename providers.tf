# This is the "default" provider that is used to create resources
# inside the AWS account where you want Control Tower to run.
provider "controltower" {
  # Use this profile, defined using programmatic credentials for
  # AWSAdministratorAccess as obtained from your AWS SSO page
  # for the AWS account where you want Control Tower to run.
  profile = "provision-aws-account"
  region  = var.aws_region
}
