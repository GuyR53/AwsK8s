resource "aws_iam_role" "keda_role_sqs" {
  name               = "KedaRoleSqs"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Principal": {
          "Federated": "arn:aws:iam::654856753336:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/89B4CFB8A482F0A224FB10595425EF20"
        },
        "Condition": {
          "StringEquals": {
            "oidc.eks.us-west-2.amazonaws.com/id/89B4CFB8A482F0A224FB10595425EF20:aud": [
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
