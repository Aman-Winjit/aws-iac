
# AWS POLICIES

#################################################################################

data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

#################################################################################

data "aws_iam_policy" "AmazonEKSServicePolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

#################################################################################

data "aws_iam_policy" "AmazonEKSVPCResourceController" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

#################################################################################

data "aws_iam_policy" "AmazonEC2ContainerRegistryReadOnly" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

#################################################################################

data "aws_iam_policy" "AmazonEKS_CNI_Policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

#################################################################################

data "aws_iam_policy" "AmazonEKSWorkerNodePolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

#################################################################################

data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

####################################################################################

# CUSTOM ECR-KMS POLICY

resource "aws_iam_policy" "KmsEcrAccessPolicy" {
  name        = "KmsEcrAccessPolicy"
  description = "IAM policy for ECR and KMS permissions"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:BatchGetImage"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
            "Resource": "*"
        }
    ]
})
}
####################################################################################

# CUSTOM ELB PERMISSION POLICY

resource "aws_iam_policy" "ELBPermissionPolicy" {
  name        = "ELBPermissionPolicy"
  description = "IAM policy for ELB permissions"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAddresses",
                "ec2:DescribeInternetGateways"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
})
}

####################################################################################

# CUSTOM CloudWatchMetrics PERMISSION POLICY

resource "aws_iam_policy" "CloudWatchMetricsPolicy" {
  name        = "CloudWatchMetricsPolicy"
  description = "IAM policy for ELB permissions"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "cloudwatch:PutMetricData"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
})
}

####################################################################################

# CUSTOM KMS WorkerNode POLICY

resource "aws_iam_policy" "KmsWorkerNodePolicy" {
  name        = "KmsWorkerNodePolicy"
  description = "IAM policy for KMS permissions"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:iam::716137715997:role/*"
        }
    ]
})
}

####################################################################################