resource "aws_cognito_user_pool" "primary" {
  name = "primary_user_pool"
}

resource "aws_cognito_user_pool_client" "intercom" {
  name = "intercom"
  user_pool_id = aws_cognito_user_pool.primary.id
  generate_secret = false
  allowed_oauth_flows = ["code"]
  allowed_oauth_scopes = ["email", "openid", "profile"]
  allowed_oauth_flows_user_pool_client = true
  explicit_auth_flows = ["USER_PASSWORD_AUTH"]
  callback_urls = [ var.aws_cognito_intercom_redirect_url ]
}

resource "aws_cognito_user" "personal" {
  user_pool_id = aws_cognito_user_pool.primary.id
  username = var.aws_cognito_default_user_username
  message_action = "SUPPRESS"
  password = var.aws_cognito_default_user_password

  attributes = {
    email = var.aws_cognito_default_user_email
    email_verified = true
  }
}

resource "aws_cognito_identity_pool" "primary" {
  identity_pool_name               = "primary"
  allow_unauthenticated_identities = false
  allow_classic_flow               = false

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.intercom.id
    provider_name           = aws_cognito_user_pool.primary.endpoint
    server_side_token_check = false
  }
}