output "oidc_provider_url" {
  description = "The URL of the OIDC provider"
  value       = replace(aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")
}

output "oidc_provider_arn" {
  description = "The ARN of the OIDC provider"
  value       = aws_iam_openid_connect_provider.this[0].arn
}