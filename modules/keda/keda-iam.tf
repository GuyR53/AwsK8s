resource "aws_iam_role" "keda_role_sqs" {
  name               = "KedaRoleSqs"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Principal": {
          "Federated": var.oidc_provider_arn
        },
        "Condition": {
          "StringEquals": {
            "${var.oidc_provider_url}:aud": [
              "sts.amazonaws.com"
            ]
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "keda_sqs_policy_attachment" {
  name       = "KedaSQSPolicyAttachment"
  roles      = [aws_iam_role.keda_role_sqs.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"  
}
