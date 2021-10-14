
resource "controltower_aws_account" "account" {
  email               = var.account_email
  name                = var.account_name
  organizational_unit = var.account_org_unit

  lifecycle {
    prevent_destroy = true
  }

  provisioned_product_name = var.provisioned_product_name

  sso {
    email      = var.sso_email
    first_name = var.sso_first_name
    last_name  = var.sso_last_name
  }

  tags = var.tags
}
