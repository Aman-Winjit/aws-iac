# AWS Credentials
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
}

###############################################################################################

# VPC VARIABLES
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "worthai-staging-vpc"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_useast1a_name" {
  description = "Name of public subnet in us-east-1a"
  type        = string
  default     = "worthai-staging-publicsubnet-USEAST1A"
}

variable "public_subnet_useast1a_cidr" {
  description = "CIDR block for public subnet in us-east-1a"
  type        = string
  default     = "10.0.0.0/20"
}

variable "public_subnet_useast1a_az" {
  description = "Availability Zone for public subnet in us-east-1a"
  type        = string
  default     = "us-east-1a"
}

variable "public_subnet_useast1b_name" {
  description = "Name of public subnet in us-east-1b"
  type        = string
  default     = "worthai-staging-publicsubnet-USEAST1B"
}

variable "public_subnet_useast1b_cidr" {
  description = "CIDR block for public subnet in us-east-1b"
  type        = string
  default     = "10.0.16.0/20"
}

variable "public_subnet_useast1b_az" {
  description = "Availability Zone for public subnet in us-east-1b"
  type        = string
  default     = "us-east-1b"
}

variable "public_subnet_useast1c_name" {
  description = "Name of public subnet in us-east-1c"
  type        = string
  default     = "worthai-staging-publicsubnet-USEAST1C"
}

variable "public_subnet_useast1c_cidr" {
  description = "CIDR block for public subnet in us-east-1c"
  type        = string
  default     = "10.0.32.0/20"
}

variable "public_subnet_useast1c_az" {
  description = "Availability Zone for public subnet in us-east-1c"
  type        = string
  default     = "us-east-1c"
}

variable "private_subnet_useast1a_name" {
  description = "Name of private subnet in us-east-1a"
  type        = string
  default     = "worthai-staging-privatesubnet-USEAST1A"
}

variable "private_subnet_useast1a_cidr" {
  description = "CIDR block for private subnet in us-east-1a"
  type        = string
  default     = "10.0.0.0/20"
}

variable "private_subnet_useast1a_az" {
  description = "Availability Zone for private subnet in us-east-1a"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_useast1b_name" {
  description = "Name of private subnet in us-east-1b"
  type        = string
  default     = "worthai-staging-privatesubnet-USEAST1B"
}

variable "private_subnet_useast1b_cidr" {
  description = "CIDR block for private subnet in us-east-1b"
  type        = string
  default     = "10.0.16.0/20"
}

variable "private_subnet_useast1b_az" {
  description = "Availability Zone for private subnet in us-east-1b"
  type        = string
  default     = "us-east-1b"
}

variable "private_subnet_useast1c_name" {
  description = "Name of private subnet in us-east-1c"
  type        = string
  default     = "worthai-staging-privatesubnet-USEAST1C"
}

variable "private_subnet_useast1c_cidr" {
  description = "CIDR block for private subnet in us-east-1c"
  type        = string
  default     = "10.0.32.0/20"
}

variable "private_subnet_useast1c_az" {
  description = "Availability Zone for private subnet in us-east-1c"
  type        = string
  default     = "us-east-1c"
}

##########

variable "internet_gateway_name" {
  description = "Name of the internet gateway"
  type        = string
  default     = "worthai-staging-igw"
}

variable "nat_gateway_az1" {
  description = "Name of NAT gateway in us-east-1a"
  type        = string
  default     = "worthai-staging-natgw-USEAST1A"
}

variable "nat_gateway_az2" {
  description = "Name of NAT gateway in us-east-1b"
  type        = string
  default     = "worthai-staging-natgw-USEAST1B"
}

variable "nat_gateway_az3" {
  description = "Name of NAT gateway in us-east-1c"
  type        = string
  default     = "worthai-staging-natgw-USEAST1C"
}

variable "eip_az1" {
  description = "Name of Elastic IP in us-east-1a"
  type        = string
  default     = "worthai-staging-eip-useast1a"
}

variable "eip_az2" {
  description = "Name of Elastic IP in us-east-1b"
  type        = string
  default     = "worthai-staging-eip-useast1b"
}

variable "eip_az3" {
  description = "Name of Elastic IP in us-east-1c"
  type        = string
  default     = "worthai-staging-eip-useast1c"
}

variable "public_route_table" {
  description = "Name of the public route table"
  type        = string
  default     = "worthai-staging-private-route-table"
}

variable "private_route_table_az1" {
  description = "Name of private route table in us-east-1a"
  type        = string
  default     = "worthai-staging-private-route-table-USEAST1A"
}

variable "private_route_table_az2" {
  description = "Name of private route table in us-east-1b"
  type        = string
  default     = "worthai-staging-private-route-table-USEAST1B"
}

variable "private_route_table_az3" {
  description = "Name of private route table in us-east-1c"
  type        = string
  default     = "worthai-staging-private-route-table-USEAST1C"
}

###############################################################################################

# SECURITY GROUP
variable "clientvpn_security_group" {
  description = "Name of Client VPN Security Group"
  type        = string
  default     = "worthai-staging-ClientVPN-SG"
}

variable "rds_security_group" {
  description = "Name of RDS Security Group"
  type        = string
  default     = "worthai-staging-Database-SG"
}

variable "eks_cluster_security_group" {
  description = "Name of EKS Cluster Security Group"
  type        = string
  default     = "worthai-staging-EksCluster-SG"
}

variable "msk_cluster_security_group" {
  description = "Name of MSK Cluster Security Group"
  type        = string
  default     = "worthai-staging-MSKCluster-SG"
}

###############################################################################################

# IAM ROLES
variable "eks_cluster_role_name" {
  description = "Name of EKS Cluster Role"
  type        = string
  default     = "worthai-staging-ekscluster-role"
}

variable "eks_nodegroup_role_name" {
  description = "Name of EKS Nodegroup Role"
  type        = string
  default     = "worthai-staging-nodegroup-role"
}

variable "kms_role_name" {
  description = "Name of KMS Role"
  type        = string
  default     = "worthai-staging-kms-role"
}

###############################################################################################

# variables.tf

# RDS
variable "rds_subnet_group_name" {
  description = "Name of RDS Subnet Group"
  type        = string
  default     = "worthai-staging-db-subnet-group"
}

variable "rds_auth_service_allocated_storage" {
  description = "Allocated storage for RDS auth-service"
  type        = number
  default     = 20  
}

variable "rds_auth_service_storage_type" {
  description = "Storage type for RDS auth-service"
  type        = string
  default     = "gp2"  
}

variable "rds_auth_service_engine" {
  description = "Engine type for RDS auth-service"
  type        = string
  default     = "postgres"  
}

variable "rds_auth_service_engine_version" {
  description = "Engine version for RDS auth-service"
  type        = string
  default     = "15.4"  
}

variable "rds_auth_service_instance_class" {
  description = "Instance class for RDS auth-service"
  type        = string
  default     = "db.t3.micro"  
}

variable "rds_auth_service_identifier" {
  description = "Identifier for RDS auth-service"
  type        = string
  default     = "auth-service"  
}

variable "rds_auth_service_parameter_group_name" {
  description = "Parameter group name for RDS auth-service"
  type        = string
  default     = "default.postgres15"  
}


variable "rds_case_service_allocated_storage" {
  description = "Allocated storage for RDS case-service"
  type        = number
  default     = 20  
}

variable "rds_case_service_storage_type" {
  description = "Storage type for RDS case-service"
  type        = string
  default     = "gp2"  
}

variable "rds_case_service_engine" {
  description = "Engine type for RDS case-service"
  type        = string
  default     = "postgres"  
}

variable "rds_case_service_engine_version" {
  description = "Engine version for RDS case-service"
  type        = string
  default     = "15.4"  
}

variable "rds_case_service_instance_class" {
  description = "Instance class for RDS case-service"
  type        = string
  default     = "db.t3.micro"  
}

variable "rds_case_service_identifier" {
  description = "Identifier for RDS case-service"
  type        = string
  default     = "case-service"  
}

variable "rds_case_service_parameter_group_name" {
  description = "Parameter group name for RDS case-service"
  type        = string
  default     = "default.postgres15" 
}

variable "rds_integration_service_allocated_storage" {
  description = "Allocated storage for RDS integration-service"
  type        = number
  default     = 20  # Provide default value if needed
}

variable "rds_integration_service_storage_type" {
  description = "Storage type for RDS integration-service"
  type        = string
  default     = "gp2"  # Provide default value if needed
}

variable "rds_integration_service_engine" {
  description = "Engine type for RDS integration-service"
  type        = string
  default     = "postgres"  # Provide default value if needed
}

variable "rds_integration_service_engine_version" {
  description = "Engine version for RDS integration-service"
  type        = string
  default     = "15.4"  # Provide default value if needed
}

variable "rds_integration_service_instance_class" {
  description = "Instance class for RDS integration-service"
  type        = string
  default     = "db.t3.micro"  # Provide default value if needed
}

variable "rds_integration_service_identifier" {
  description = "Identifier for RDS integration-service"
  type        = string
  default     = "integration-service"  # Provide default value if needed
}

variable "rds_integration_service_parameter_group_name" {
  description = "Parameter group name for RDS integration-service"
  type        = string
  default     = "default.postgres15"  # Provide default value if needed
}

###############################################################################################

# KMS
variable "kms_name" {
  description = "Name of KMS"
  type        = string
  default     = "worthai-staging-secrets"
}

variable "kms_alias" {
  description = "Alias for KMS"
  type        = string
  default     = "alias/worthai-staging-kms"
}

###############################################################################################

# S3 Bucket
variable "s3_admin_bucket" {
  description = "Admin S3 Bucket"
  type        = string
  default     = "worthai-staging-worth-admin"
}

variable "s3_customer_bucket" {
  description = "Customer S3 Bucket"
  type        = string
  default     = "worthai-staging-customer-admin"
}

variable "s3_applicant_bucket" {
  description = "Applicant S3 Bucket"
  type        = string
  default     = "worthai-staging-applicant"
}

variable "s3_assets_bucket" {
  description = "Assets S3 Bucket"
  type        = string
  default     = "worthai-staging-assets"
}

###############################################################################################

# ACM
variable "admin_domain" {
  description = "Admin Domain"
  type        = string
  default     = "admin.staging.joinworth.com"
}

variable "customer_domain" {
  description = "Customer Domain"
  type        = string
  default     = "customer.staging.joinworth.com"
}

variable "applicant_domain" {
  description = "Applicant Domain"
  type        = string
  default     = "app.staging.joinworth.com"
}

variable "backend_domain" {
  description = "Backend Domain"
  type        = string
  default     = "api.staging.joinworth.com"
}

variable "argocd_domain" {
  description = "ArgoCD Domain"
  type        = string
  default     = "argocd.staging.joinworth.com"
}

###############################################################################################

# CLIENT VPN
variable "client_vpn_name" {
  description = "Name of the Client VPN"
  type        = string
  default     = "worthai-staging-clientVPN"
}

variable "vpn_client_cidr_block" {
  description = "Client CIDR block for VPN"
  type        = string
  default     = "11.0.0.0/16"
}

variable "server_certificate_arn" {
  description = "ARN of the server certificate"
  type        = string
  default     = "arn:aws:acm:us-east-1:786888909921:certificate/90acc959-f6d9-4be5-b6cf-8a33da99f5b7"
}

variable "root_certificate_chain_arn" {
  description = "ARN of the root certificate chain"
  type        = string
  default     = "arn:aws:acm:us-east-1:786888909921:certificate/64e78eb7-1ade-4e95-900c-5a76efd04c48"
}

variable "vpn_target_network_cidr" {
  description = "Target network CIDR for VPN"
  type        = string
  default     = "0.0.0.0/0"
}

###############################################################################################

# EKS CLUSTER
variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "worthai-staging-ekscluster"
}

variable "eks_nodegroup_name" {
  description = "Name of the EKS Nodegroup"
  type        = string
  default     = "worthai-staging-nodegroup"
}

variable "nodegroup_ami_type" {
  description = "AMI type for the EKS Nodegroup"
  type        = string
  default     = "AL2_x86_64"
}

variable "nodegroup_instance_types" {
  description = "Instance types for the EKS Nodegroup"
  type        = string
  default     = "t3.medium"
}

variable "nodegroup_disk_size" {
  description = "Disk size for the EKS Nodegroup"
  type        = number
  default     = 30
}

variable "nodes_desired_size" {
  description = "Desired number of nodes in the EKS Nodegroup"
  type        = number
  default     = 2
}

variable "nodes_max_size" {
  description = "Maximum number of nodes in the EKS Nodegroup"
  type        = number
  default     = 2
}

variable "nodes_min_size" {
  description = "Minimum number of nodes in the EKS Nodegroup"
  type        = number
  default     = 2
}

variable "nodes_max_unavailable" {
  description = "Maximum number of unavailable nodes in the EKS Nodegroup"
  type        = number
  default     = 2
}

###############################################################################################

# SECRET MANAGER
variable "secret_name" {
  description = "Name of the Secret in Secret Manager"
  type        = string
  default     = "AmazonMSK_worthai_authentication_credential"
}

###############################################################################################

# MSK
variable "msk_cluster_name" {
  description = "Name of the MSK Cluster"
  type        = string
  default     = "worthai-staging-kafka"
}

variable "kafka_version" {
  description = "Version of Kafka in MSK Cluster"
  type        = string
  default     = "3.3.2"
}

variable "number_of_broker_nodes" {
  description = "Number of broker nodes in MSK Cluster"
  type        = number
  default     = 3
}

variable "broker_node_instance_type" {
  description = "Instance type for broker nodes in MSK Cluster"
  type        = string
  default     = "kafka.m5.large"
}

variable "broker_node_volume_size" {
  description = "Volume size for broker nodes in MSK Cluster"
  type        = number
  default     = 100
}

###############################################################################################

# SES
variable "ses_email" {
  description = "Email address for SES"
  type        = string
  default     = "no-reply2323312@joinworth.com"
}

###############################################################################################

# COGNITO
variable "admin_user_pool_name" {
  description = "Admin user pool name in Cognito"
  type        = string
  default     = "worth-staging-admin"
}

variable "admin_client_name" {
  description = "Admin client name in Cognito"
  type        = string
  default     = "worth-staging-admin"
}

variable "admin_domain_prefix" {
  description = "Admin domain prefix in Cognito"
  type        = string
  default     = "worth-staging-admin"
}

variable "customer_user_pool_name" {
  description = "Customer user pool name in Cognito"
  type        = string
  default     = "worth-staging-customer"
}

variable "customer_client_name" {
  description = "Customer client name in Cognito"
  type        = string
  default     = "worth-staging-customer"
}

variable "customer_domain_prefix" {
  description = "Customer domain prefix in Cognito"
  type        = string
  default     = "worth-staging-customer"
}

variable "applicant_user_pool_name" {
  description = "Applicant user pool name in Cognito"
  type        = string
  default     = "worth-staging-applicant"
}

variable "applicant_client_name" {
  description = "Applicant client name in Cognito"
  type        = string
  default     = "worth-staging-applicant"
}

variable "applicant_domain_prefix" {
  description = "Applicant domain prefix in Cognito"
  type        = string
  default     = "worth-staging-applicant"
}

variable "cognito_callback_url" {
  description = "Callback URL for Cognito"
  type        = string
  default     = "https://localhost:3000"
}

###############################################################################################

## SECRETS

# RDS CRED
variable "rds_auth_service_db_name" {
  description = "RDS auth_service database name"
  type        = string
  default     = "auth_service"
}

variable "rds_auth_service_username" {
  description = "RDS auth_service username"
  type        = string
  default     = "postgres"
}

variable "rds_auth_service_password" {
  description = "RDS auth_service password"
  type        = string
  default     = "zmGb8NCJtkqW3fYuMvXg"
}

variable "rds_case_service_db_name" {
  description = "RDS case_service database name"
  type        = string
  default     = "case_service"
}

variable "rds_case_service_username" {
  description = "RDS case_service username"
  type        = string
  default     = "postgres"
}

variable "rds_case_service_password" {
  description = "RDS case_service password"
  type        = string
  default     = "zmGb8NCJtkqW3fYuMvXg"
}

variable "rds_integration_service_db_name" {
  description = "RDS integration_service database name"
  type        = string
  default     = "integration_service"
}

variable "rds_integration_service_username" {
  description = "RDS integration_service username"
  type        = string
  default     = "postgres"
}

variable "rds_integration_service_password" {
  description = "RDS integration_service password"
  type        = string
  default     = "zmGb8NCJtkqW3fYuMvXg"
}

###############################################################################################

# KAFKA (MSK)
variable "kafka_username" {
  description = "Username for Kafka (MSK)"
  type        = string
  default     = "worthai-staging-kafka"
}

variable "kafka_password" {
  description = "Password for Kafka (MSK)"
  type        = string
  default     = "sW9adxPjTQtt5sM"
}

###############################################################################################