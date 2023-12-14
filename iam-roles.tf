# CREATE EKS CLUSTER ROLE 

resource "aws_iam_role" "worthai_ekscluster_role" {
  name = var.eks_cluster_role_name

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com",
                "AWS": "*"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
}

# ATTACH POLICIES WITH ROLES :

resource "aws_iam_role_policy_attachment" "attach_AmazonEKSClusterPolicy" {
  role       = aws_iam_role.worthai_ekscluster_role.name
  policy_arn = data.aws_iam_policy.AmazonEKSClusterPolicy.arn
}

resource "aws_iam_role_policy_attachment" "attach_AmazonEKSServicePolicy" {
  role       = aws_iam_role.worthai_ekscluster_role.name
  policy_arn = data.aws_iam_policy.AmazonEKSServicePolicy.arn
}

resource "aws_iam_role_policy_attachment" "attach_AmazonEKSVPCResourceController" {
  role       = aws_iam_role.worthai_ekscluster_role.name
  policy_arn = data.aws_iam_policy.AmazonEKSVPCResourceController.arn
}

resource "aws_iam_policy_attachment" "attach_ELBPermissionPolicy" {
  name       = "ELBPermissionPolicy"
  roles      = [aws_iam_role.worthai_ekscluster_role.name]
  policy_arn = aws_iam_policy.ELBPermissionPolicy.arn
}

resource "aws_iam_policy_attachment" "attach_CloudWatchMetricsPolicy" {
  name       = "CloudWatchMetricsPolicy"
  roles      = [aws_iam_role.worthai_ekscluster_role.name]
  policy_arn = aws_iam_policy.CloudWatchMetricsPolicy.arn
}

####################################################################################

# CREATE EKS NODEGROUP ROLE

resource "aws_iam_role" "worthai_nodegroup_role" {
  name = var.eks_nodegroup_role_name

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com",
                "AWS": "*"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
}

# ATTACH POLICIES WITH ROLES :

resource "aws_iam_role_policy_attachment" "attach_AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.worthai_nodegroup_role.name
  policy_arn = data.aws_iam_policy.AmazonEC2ContainerRegistryReadOnly.arn
}

resource "aws_iam_role_policy_attachment" "attach_AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.worthai_nodegroup_role.name
  policy_arn = data.aws_iam_policy.AmazonEKS_CNI_Policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.worthai_nodegroup_role.name
  policy_arn = data.aws_iam_policy.AmazonEKSWorkerNodePolicy.arn
}

resource "aws_iam_role_policy_attachment" "attach_AmazonSSMManagedInstanceCore" {
  role       = aws_iam_role.worthai_nodegroup_role.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_policy_attachment" "attach_KmsWorkerNodePolicy" {
  name       = "KmsWorkerNodePolicy"
  roles      = [aws_iam_role.worthai_nodegroup_role.name]
  policy_arn = aws_iam_policy.KmsWorkerNodePolicy.arn
}

####################################################################################

# CREATE KMS ROLE

resource "aws_iam_role" "worthai_kms_role" {
  name = var.kms_role_name

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com",
                "AWS": "*"
                },
            "Action": "sts:AssumeRole"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::786888909921:role/worthai-staging-nodegroup-role"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
}

#################################################################################

# ATTACH COMMON POLICY FOR ALL ROLES :

# ECR-KMS POLICY
resource "aws_iam_policy_attachment" "attach_KmsEcrAccessPolicy" {
  name       = "KmsEcrAccessPolicy"
  roles      = [aws_iam_role.worthai_ekscluster_role.name, 
                aws_iam_role.worthai_nodegroup_role.name, 
                aws_iam_role.worthai_kms_role.name]
  policy_arn = aws_iam_policy.KmsEcrAccessPolicy.arn
}

#################################################################################

# OUTPUT BLOCK TO PRINT ROLES ARN 

output "ekscluster_role_arn" {
  description = "Eks Cluster Role ARN"
  value = aws_iam_role.worthai_ekscluster_role.arn
}

output "nodegroup_role_arn" {
  description = "Nodegroup Role ARN"
  value = aws_iam_role.worthai_nodegroup_role.arn
}

output "kms_role_arn" {
  description = "KMS Role ARN"
  value = aws_iam_role.worthai_kms_role.arn
}

#################################################################################
