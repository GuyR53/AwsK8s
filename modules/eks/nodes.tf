resource "aws_eks_node_group" "this" {
    for_each = var.node_groups

    cluster_name    = aws_eks_cluster.this.name
    node_group_name = each.key
    node_role_arn   = aws_iam_role.nodes.arn

    subnet_ids = var.subnet_ids

    capacity_type  = each.value.capacity_type
    instance_types = each.value.instance_types

    scaling_config {
      desired_size = each.value.scaling_config.desired_size
      max_size     = each.value.scaling_config.max_size
      min_size     = each.value.scaling_config.min_size
    }

    update_config {
      max_unavailable = 1
    }

    labels = {
      role = each.key
    }
    dynamic "taint" {
    for_each = each.key == "data_pool" ? [1] : []
    content {
      key    = "Node_Pool"
      value  = each.key
      effect = "NO_SCHEDULE"
    }
  }

  #   dynamic "remote_access" {
  #   for_each = var.security_group_id != "" ? [1] : []
  #   content {
  #     ec2_ssh_key = var.ec2_ssh_key
  #     source_security_group_ids = [var.nodegroup_securitygroup]
  #   }
  # }

  depends_on = [aws_iam_role_policy_attachment.nodes]
  }


