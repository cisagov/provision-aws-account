
resource "controltower_aws_account" "accounts" {
  for_each = { for account in var.accounts : account.provisioned_product_name => account }

  email               = each.value.account_email
  name                = each.value.account_name
  organizational_unit = each.value.account_org_unit

  lifecycle {
    prevent_destroy = true
  }

  provisioned_product_name = each.key

  sso {
    email      = each.value.sso_email
    first_name = each.value.sso_first_name
    last_name  = each.value.sso_last_name
  }

  tags = var.tags
}
