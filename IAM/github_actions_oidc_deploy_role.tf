resource "aws_iam_role" "github_actions_oidc_role" {
  name = "GitHubActionsOIDCDeployRole"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": var.aws_github_oidc_assume_rule_arn
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                },
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:kieranmanning/*",
                }
            }
        }
    ]
  })
}