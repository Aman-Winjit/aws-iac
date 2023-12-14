# CREATE SECRETS FOR KAFKA CRED

resource "aws_secretsmanager_secret" "worthai_kafka_authentication_credential" {
  name = var.secret_name
  kms_key_id =  aws_kms_key.worthai_kms_key.arn
}

resource "aws_secretsmanager_secret_version" "kafka_credentials_version" {
  secret_id     = aws_secretsmanager_secret.worthai_kafka_authentication_credential.id
  secret_string = jsonencode({
    username = var.kafka_username,
    password = var.kafka_password
  })
}

###########################################################################################

# CREATE MSK CLUSTER 

resource "aws_msk_cluster" "worthai_msk_cluster" {
  cluster_name  = var.msk_cluster_name
  kafka_version = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type = var.broker_node_instance_type
    client_subnets = [aws_subnet.worthai_privatesubnet_useast1a.id, 
                  aws_subnet.worthai_privatesubnet_useast1b.id,
                  aws_subnet.worthai_privatesubnet_useast1c.id]
    storage_info {
      ebs_storage_info {
        volume_size = var.broker_node_volume_size
      }
    }
    security_groups = [aws_security_group.worthai_mskcluster_sg.id]
  }

  client_authentication {
    sasl {
      scram = true
    }
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.worthai_kms_key.arn
  }
}

###########################################################################################

# ASSOCIATE SECRETS WITH SASL IN MSK CLUSTER 

resource "aws_msk_scram_secret_association" "worthai_secret_association" {
  cluster_arn     = aws_msk_cluster.worthai_msk_cluster.arn
  secret_arn_list = [aws_secretsmanager_secret.worthai_kafka_authentication_credential.arn]
}


###########################################################################################

# OUTPUT 

output "msk_cluster_arn" {
  value = aws_msk_cluster.worthai_msk_cluster.arn
}

output "secret_name" {
  value = aws_secretsmanager_secret.worthai_kafka_authentication_credential.name
}

###########################################################################################