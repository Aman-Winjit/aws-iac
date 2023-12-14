# CREATE ECR REPOS 

resource "aws_ecr_repository" "auth_service" {
  name                 = "auth-service"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type    = "AES256"
  }
  tags = {
    Environment = "Production"
  }
}

#################################################################################

resource "aws_ecr_repository" "auth_service_migration" {
  name                 = "auth-service-migration"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type    = "AES256"
  }
  tags = {
    Environment = "Production"
  }
}

#################################################################################

resource "aws_ecr_repository" "case_service" {
  name                 = "case-service"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type    = "AES256"
  }
  tags = {
    Environment = "Production"
  }
}

#################################################################################

resource "aws_ecr_repository" "case_service_migration" {
  name                 = "case-service-migration"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type    = "AES256"
  }
  tags = {
    Environment = "Production"
  }
}

#################################################################################

resource "aws_ecr_repository" "integration_service" {
  name                 = "integration-service"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type    = "AES256"
  }
  tags = {
    Environment = "Production"
  }
}

#################################################################################

resource "aws_ecr_repository" "integration_service_migration" {
  name                 = "integration-service-migration"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type    = "AES256"
  }
  tags = {
    Environment = "Production"
  }
}

#################################################################################

# OUTPUT BLOCK TO PRINT ECR URL :

output "auth_service_uri" {
  description = "Auth service ECR URL"
  value = aws_ecr_repository.auth_service.repository_url
}

output "auth_service_migration_uri" {
  description = "Auth service migration ECR URL"
  value = aws_ecr_repository.auth_service_migration.repository_url
}

output "case_service_uri" {
  description = "Case service ECR URL"
  value = aws_ecr_repository.case_service.repository_url
}

output "case_service_migration_uri" {
  description = "Case service migration ECR URL"
  value = aws_ecr_repository.case_service_migration.repository_url
}

output "integration_service_uri" {
  description = "Integration service ECR URL"
  value = aws_ecr_repository.integration_service.repository_url
}

output "integration_service_migration_uri" {
  description = "Integration service migration ECR URL"
  value = aws_ecr_repository.integration_service_migration.repository_url
}

#################################################################################

