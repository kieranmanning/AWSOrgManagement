resource "aws_iam_role" "kmanning_intercom_login" {
    name = "kmanning_intercom_login"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect = "Allow",
                Action = [ "apigateway:GET" ]
                Resource = "*"
            }
        ]
    })
}