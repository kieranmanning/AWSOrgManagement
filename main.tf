module "IAM" {
  source = "./IAM"

  aws_github_oidc_assume_rule_arn = var.aws_github_oidc_assume_rule_arn
}

module "Cognito" {
  source = "./Cognito"

  aws_cognito_intercom_redirect_url = var.aws_cognito_intercom_redirect_url
  aws_cognito_default_user_username = var.aws_cognito_default_user_username
  aws_cognito_default_user_email = var.aws_cognito_default_user_email
  aws_cognito_default_user_password = var.aws_cognito_default_user_password
}