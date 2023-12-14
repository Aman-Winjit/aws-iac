# AWS CRED

aws_region = "us-east-1"
aws_profile = "worth-staging-admin"

###############################################################################################

# VPC VARIABLES 
vpc_name = "worthai-staging-vpc"
vpc_cidr_block = "10.0.0.0/16"

public_subnet_useast1a_name = "worthai-staging-publicsubnet-USEAST1A"
public_subnet_useast1a_cidr = "10.0.0.0/20"
public_subnet_useast1a_az = "us-east-1a"

public_subnet_useast1b_name = "worthai-staging-publicsubnet-USEAST1B"
public_subnet_useast1b_cidr = "10.0.16.0/20"
public_subnet_useast1b_az = "us-east-1b"

public_subnet_useast1c_name = "worthai-staging-publicsubnet-USEAST1C"
public_subnet_useast1c_cidr = "10.0.32.0/20"
public_subnet_useast1c_az = "us-east-1c"


private_subnet_useast1a_name = "worthai-staging-privatesubnet-USEAST1A"
private_subnet_useast1a_cidr = "10.0.128.0/20"
private_subnet_useast1a_az = "us-east-1a"

private_subnet_useast1b_name = "worthai-staging-privatesubnet-USEAST1B"
private_subnet_useast1b_cidr = "10.0.144.0/20"
private_subnet_useast1b_az = "us-east-1b"

private_subnet_useast1c_name = "worthai-staging-privatesubnet-USEAST1C"
private_subnet_useast1c_cidr = "10.0.160.0/20"
private_subnet_useast1c_az = "us-east-1c"

internet_gateway_name = "worthai-staging-igw"

nat_gateway_az1 = "worthai-staging-natgw-USEAST1A"
nat_gateway_az2 = "worthai-staging-natgw-USEAST1B"
nat_gateway_az3 = "worthai-staging-natgw-USEAST1C"

eip_az1 = "worthai-staging-eip-useast1a"
eip_az2 = "worthai-staging-eip-useast1b"
eip_az3 = "worthai-staging-eip-useast1c"

public_route_table = "worthai-staging-public-route-table"

private_route_table_az1 = "worthai-staging-private-route-table-USEAST1A"
private_route_table_az2 = "worthai-staging-private-route-table-USEAST1B"
private_route_table_az3 = "worthai-staging-private-route-table-USEAST1C"

###############################################################################################

# SECURITY GROUP

clientvpn_security_group = "worthai-staging-ClientVPN-SG"
rds_security_group = "worthai-staging-Database-SG"
eks_cluster_security_group = "worthai-staging-EksCluster-SG"
msk_cluster_security_group = "worthai-staging-MSKCluster-SG"

###############################################################################################

# IAM ROLES

eks_cluster_role_name = "worthai-staging-ekscluster-role"
eks_nodegroup_role_name = "worthai-staging-nodegroup-role"
kms_role_name = "worthai-staging-kms-role"

###############################################################################################

# RDS
rds_subnet_group_name = "worthai-staging-db-subnet-group"

rds_auth_service_allocated_storage = 20
rds_auth_service_storage_type = "gp2"
rds_auth_service_engine = "postgres"
rds_auth_service_engine_version = "15.4"
rds_auth_service_instance_class = "db.t3.micro" 
rds_auth_service_identifier = "auth-service"
rds_auth_service_parameter_group_name = "default.postgres15"

rds_case_service_allocated_storage = 20
rds_case_service_storage_type = "gp2"
rds_case_service_engine = "postgres"
rds_case_service_engine_version = "15.4"
rds_case_service_instance_class = "db.t3.micro" 
rds_case_service_identifier = "case-service"
rds_case_service_parameter_group_name = "default.postgres15"

rds_integration_service_allocated_storage = 20
rds_integration_service_storage_type = "gp2"
rds_integration_service_engine = "postgres"
rds_integration_service_engine_version = "15.4"
rds_integration_service_instance_class = "db.t3.micro" 
rds_integration_service_identifier = "integration-service"
rds_integration_service_parameter_group_name = "default.postgres15"

###############################################################################################

# KMS
kms_name = "worthai-staging-secrets"
kms_alias = "alias/worthai-staging-kms"

###############################################################################################

# S3 Bucket

s3_admin_bucket = "worthai-staging-worth-admin" 
s3_customer_bucket = "worthai-staging-customer-admin"
s3_applicant_bucket = "worthai-staging-applicant"
s3_assets_bucket = "worthai-staging-assets"

###############################################################################################

# ACM

admin_domain = "admin.staging.joinworth.com"
customer_domain = "customer.staging.joinworth.com"
applicant_domain = "app.staging.joinworth.com"
backend_domain = "api.staging.joinworth.com"
argocd_domain = "argocd.staging.joinworth.com"

###############################################################################################


# CLIENT VPN

client_vpn_name = "worthai-staging-clientVPN"
vpn_client_cidr_block = "11.0.0.0/16"
server_certificate_arn = "arn:aws:acm:us-east-1:786888909921:certificate/90acc959-f6d9-4be5-b6cf-8a33da99f5b7"
root_certificate_chain_arn = "arn:aws:acm:us-east-1:786888909921:certificate/64e78eb7-1ade-4e95-900c-5a76efd04c48"
vpn_target_network_cidr = "0.0.0.0/0"

###############################################################################################

# EKS CLUSTER

eks_cluster_name = "worthai-staging-ekscluster"
eks_nodegroup_name = "worthai-staging-nodegroup"
nodegroup_ami_type = "AL2_x86_64"
nodegroup_instance_types = "t3.medium"
nodegroup_disk_size = 30

nodes_desired_size = 2
nodes_max_size = 2
nodes_min_size = 2

nodes_max_unavailable = 2

###############################################################################################

# SECRET MANAGER
secret_name = "AmazonMSK_worth_staging_auth_credentials"

###############################################################################################

# MSK
msk_cluster_name =  "worthai-staging-kafka"
kafka_version = "3.3.2"
number_of_broker_nodes = 3

broker_node_instance_type = "kafka.m5.large"
broker_node_volume_size = 100

###############################################################################################

# SES
ses_email = "no-reply2323312@joinworth.com"

###############################################################################################

# COGNITO

admin_user_pool_name = "worth-staging-admin"
admin_client_name = "worth-staging-admin"
admin_domain_prefix = "worth-staging-admin"

customer_user_pool_name = "worth-staging-customer"
customer_client_name = "worth-staging-customer"
customer_domain_prefix = "worth-staging-customer"

applicant_user_pool_name = "worth-staging-applicant"
applicant_client_name = "worth-staging-applicant"
applicant_domain_prefix = "worth-staging-applicant"

cognito_callback_url = "https://localhost:3000"

###############################################################################################