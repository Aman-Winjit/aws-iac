# CREATE CLIENT VPN ENDPOINT

resource "aws_ec2_client_vpn_endpoint" "worthai_client_vpn" {
  description            = "VPN to access private AWS resources"
  server_certificate_arn = var.server_certificate_arn
  client_cidr_block      = var.vpn_client_cidr_block

  authentication_options {
    type               = "certificate-authentication"
    root_certificate_chain_arn = var.root_certificate_chain_arn
    }

  split_tunnel = true
  vpc_id = aws_vpc.worthai_vpc.id
  security_group_ids = [aws_security_group.worthai_clientVPN.id]

  connection_log_options {
    enabled               = false
  }
  tags = {
    Name = var.client_vpn_name
  }

}

###################################################################################################

# AUTHORIZATION RULE 

resource "aws_ec2_client_vpn_authorization_rule" "worthai_vpn_auth_rule" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.worthai_client_vpn.id
  target_network_cidr    =  var.vpn_target_network_cidr
  authorize_all_groups   = true
}

###################################################################################################

# TARGET NETWORK ASSOCIATION 

resource "aws_ec2_client_vpn_network_association" "worthai_vpn_network_assoc_a" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.worthai_client_vpn.id
  subnet_id              = aws_subnet.worthai_privatesubnet_useast1a.id
}

resource "aws_ec2_client_vpn_network_association" "worthai_vpn_network_assoc_b" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.worthai_client_vpn.id
  subnet_id              = aws_subnet.worthai_privatesubnet_useast1b.id
}

resource "aws_ec2_client_vpn_network_association" "worthai_vpn_network_assoc_c" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.worthai_client_vpn.id
  subnet_id              = aws_subnet.worthai_privatesubnet_useast1c.id
}


###################################################################################################

###################################################################################################