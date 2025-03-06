variable "aws_cognito_intercom_redirect_url" {
    description = "aws_cognito_intercom_redirect_url"
    type = string
    sensitive = true
}

variable "aws_cognito_default_user_username" {
    description = "aws_cognito_default_user_username"
    type = string
    sensitive = true
}

variable "aws_cognito_default_user_email" {
    description = "aws_cognito_default_user_email"
    type = string
    sensitive = true
}

variable "aws_cognito_default_user_password" {
    description = "aws_cognito_default_user_password"
    type = string
    sensitive = true
}

variable "aws_github_oidc_assume_rule_arn" {
    description = "aws_github_oidc_assume_rule_arn"
    type = string
    sensitive = true
}

variable "aws_account_id" {
    description = "aws_account_id"
    type = string
    sensitive = true
}
