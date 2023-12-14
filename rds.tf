# Create a DB subnet group for RDS

resource "aws_db_subnet_group" "worthai_db_subnet_group" {
  name       = var.rds_subnet_group_name
  subnet_ids = [
    aws_subnet.worthai_privatesubnet_useast1a.id,
    aws_subnet.worthai_privatesubnet_useast1b.id,
    aws_subnet.worthai_privatesubnet_useast1c.id
  ]
  tags = {
    Name = var.rds_subnet_group_name
  }
}

##################################################################################

##################################################################################

# Create RDS PostgreSQL instance in the private subnets for auth-service

resource "aws_db_instance" "auth_service" {
  allocated_storage    = var.rds_auth_service_allocated_storage
  storage_type         = var.rds_auth_service_storage_type
  engine               = var.rds_auth_service_engine
  engine_version       = var.rds_auth_service_engine_version
  instance_class       = var.rds_auth_service_instance_class 
  identifier           = var.rds_auth_service_identifier
  db_name              = var.rds_auth_service_db_name
  username             = var.rds_auth_service_username
  password             = var.rds_auth_service_password
  db_subnet_group_name = aws_db_subnet_group.worthai_db_subnet_group.name
  parameter_group_name = var.rds_auth_service_parameter_group_name
  publicly_accessible  = false
  skip_final_snapshot  = true
  tags = {
    Name = "worthai-db-instance"
  }
  vpc_security_group_ids = [aws_security_group.rds_postgres_sg.id]
}

#################################################################################

# Create RDS PostgreSQL instance in the private subnets for case-service

resource "aws_db_instance" "case_service" {
  allocated_storage    = var.rds_case_service_allocated_storage
  storage_type         = var.rds_case_service_storage_type
  engine               = var.rds_case_service_engine
  engine_version       = var.rds_case_service_engine_version
  instance_class       = var.rds_case_service_instance_class 
  identifier           = var.rds_case_service_identifier
  db_name              = var.rds_case_service_db_name
  username             = var.rds_case_service_username
  password             = var.rds_case_service_password
  db_subnet_group_name = aws_db_subnet_group.worthai_db_subnet_group.name
  parameter_group_name = var.rds_case_service_parameter_group_name
  publicly_accessible  = false
  skip_final_snapshot  = true  # Change as needed
  tags = {
    Name = "worthai-db-instance"
  }
  vpc_security_group_ids = [aws_security_group.rds_postgres_sg.id]
}

#################################################################################

# Create RDS PostgreSQL instance in the private subnets for integration-service

resource "aws_db_instance" "integration_service" {
  allocated_storage    = var.rds_integration_service_allocated_storage
  storage_type         = var.rds_integration_service_storage_type
  engine               = var.rds_integration_service_engine
  engine_version       = var.rds_integration_service_engine_version
  instance_class       = var.rds_integration_service_instance_class 
  identifier           = var.rds_integration_service_identifier
  db_name              = var.rds_integration_service_db_name
  username             = var.rds_integration_service_username
  password             = var.rds_integration_service_password
  db_subnet_group_name = aws_db_subnet_group.worthai_db_subnet_group.name
  parameter_group_name = var.rds_integration_service_parameter_group_name
  publicly_accessible  = false
  skip_final_snapshot  = true  # Change as needed
  tags = {
    Name = "worthai-db-instance"
  }
  vpc_security_group_ids = [aws_security_group.rds_postgres_sg.id]
}

#################################################################################


# OUTPUT BLOCK TO PRINT RDS ENDPOINT 

output "auth_service_endpoint" {
  description = "Auth service endpoint"
  value = aws_db_instance.auth_service.endpoint
}

output "case_service_endpoint" {
  description = "Case service endpoint"
  value = aws_db_instance.case_service.endpoint
}

output "integration_service_endpoint" {
  description = "Integration service endpoint"
  value = aws_db_instance.integration_service.endpoint
}

#################################################################################



