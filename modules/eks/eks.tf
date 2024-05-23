resource "aws_eks_cluster" "this" {
  name     = "${var.env}-${var.eks_name}"
  version  = var.eks_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false

    subnet_ids = var.subnet_ids
    security_group_ids = ["${var.security_group_id}"]
  }

  depends_on = [aws_iam_role_policy_attachment.eks, aws_cloudwatch_log_group.this]
  enabled_cluster_log_types = ["api", "audit"]
}

resource "aws_iam_role" "eks" {
  name = "${var.env}-${var.eks_name}-eks-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/eks/${var.eks_name}/cluster"
  retention_in_days = 7
}

