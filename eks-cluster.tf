resource "aws_eks_cluster" "worthai_eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.worthai_ekscluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.worthai_privatesubnet_useast1a.id, 
                  aws_subnet.worthai_privatesubnet_useast1b.id,
                  aws_subnet.worthai_privatesubnet_useast1c.id]
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids = [aws_security_group.worthai_ekscluster_sg.id]
  }

}

################################################################################################

# NODE GROUP FOR EKS CLUSTER

resource "aws_eks_node_group" "worthai_nodegroup" {
  cluster_name    = aws_eks_cluster.worthai_eks_cluster.name
  node_group_name = var.eks_nodegroup_name
  node_role_arn   = aws_iam_role.worthai_nodegroup_role.arn
  subnet_ids      = [aws_subnet.worthai_privatesubnet_useast1a.id, 
                     aws_subnet.worthai_privatesubnet_useast1b.id,
                     aws_subnet.worthai_privatesubnet_useast1c.id]

  scaling_config {
    desired_size = var.nodes_desired_size
    max_size     = var.nodes_max_size
    min_size     = var.nodes_min_size
  }

  update_config {
    max_unavailable = var.nodes_max_unavailable
  }
  ami_type = var.nodegroup_ami_type
  instance_types = [var.nodegroup_instance_types]
  disk_size = var.nodegroup_disk_size

}

#########################################################################################

output "endpoint" {
  description = "EKS CLUSTER ENDPOINT"
  value = aws_eks_cluster.worthai_eks_cluster.endpoint
}

#########################################################################################

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.worthai_eks_cluster.certificate_authority[0].data
}