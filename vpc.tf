# CREATE VPC
resource "aws_vpc" "worthai_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
} 

#########################################################################

# CREATE PUBLIC SUBNETS

resource "aws_subnet" "worthai_publicsubnet_useast1a" {
  vpc_id            = aws_vpc.worthai_vpc.id
  cidr_block        = var.public_subnet_useast1a_cidr
  availability_zone = var.public_subnet_useast1a_az
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_useast1a_name
  }
}

resource "aws_subnet" "worthai_publicsubnet_useast1b" {
  vpc_id            = aws_vpc.worthai_vpc.id
  cidr_block        = var.public_subnet_useast1b_cidr
  availability_zone = var.public_subnet_useast1b_az
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_useast1b_name
  }
}

resource "aws_subnet" "worthai_publicsubnet_useast1c" {
  vpc_id            = aws_vpc.worthai_vpc.id
  cidr_block        = var.public_subnet_useast1c_cidr
  availability_zone = var.public_subnet_useast1c_az
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_useast1c_name
  }
}

###########################################################################

# CREATE PRIVATE SUBNETS

resource "aws_subnet" "worthai_privatesubnet_useast1a" {
  vpc_id            = aws_vpc.worthai_vpc.id
  cidr_block        = var.private_subnet_useast1a_cidr
  availability_zone = var.private_subnet_useast1a_az
  tags = {
    Name = var.private_subnet_useast1a_name
  }
}

resource "aws_subnet" "worthai_privatesubnet_useast1b" {
  vpc_id            = aws_vpc.worthai_vpc.id
  cidr_block        = var.private_subnet_useast1b_cidr
  availability_zone = var.private_subnet_useast1b_az
  tags = {
    Name = var.private_subnet_useast1b_name
  }
}

resource "aws_subnet" "worthai_privatesubnet_useast1c" {
  vpc_id            = aws_vpc.worthai_vpc.id
  cidr_block        = var.private_subnet_useast1c_cidr
  availability_zone = var.private_subnet_useast1c_az
  tags = {
    Name = var.private_subnet_useast1c_name
  }
}

#########################################################################


# CREATE INTERNET GATEWAY
resource "aws_internet_gateway" "worthai_igw" {
  vpc_id = aws_vpc.worthai_vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

###########################################################################

# CREATE NAT GATEWAYS
resource "aws_nat_gateway" "worthai_natgw_useast1a" {
  allocation_id = aws_eip.worthai_eip_useast1a.id
  subnet_id     = aws_subnet.worthai_publicsubnet_useast1a.id
  tags = {
    Name = var.nat_gateway_az1
  }
}

resource "aws_nat_gateway" "worthai_natgw_useast1b" {
  allocation_id = aws_eip.worthai_eip_useast1b.id
  subnet_id     = aws_subnet.worthai_publicsubnet_useast1b.id
  tags = {
    Name = var.nat_gateway_az2
  }
}

resource "aws_nat_gateway" "worthai_natgw_useast1c" {
  allocation_id = aws_eip.worthai_eip_useast1c.id
  subnet_id     = aws_subnet.worthai_publicsubnet_useast1c.id
  tags = {
    Name = var.nat_gateway_az3
  }
}

###########################################################################

# CREATE EIPs
resource "aws_eip" "worthai_eip_useast1a" {
  domain   = "vpc"
  tags = {
    Name = var.eip_az1
  }
}

resource "aws_eip" "worthai_eip_useast1b" {
  domain   = "vpc"
  tags = {
    Name = var.eip_az2
  }
}

resource "aws_eip" "worthai_eip_useast1c" {
  domain   = "vpc"
  tags = {
    Name = var.eip_az3
  }
}

#############################################################################


# CREATE PUBLIC SUBNET ROUTE TABLE

resource "aws_route_table" "worthai_public_route_table" {
  vpc_id = aws_vpc.worthai_vpc.id
  tags = {
    Name = var.public_route_table
  }
}

resource "aws_route" "worthai_public_route" {
  count                  = 3
  route_table_id         = aws_route_table.worthai_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.worthai_igw.id
}

###########################################################################

# CREATE PRIVATE SUBNET ROUTE TABLE

resource "aws_route_table" "worthai_private_route_table_useast1a" {
  vpc_id = aws_vpc.worthai_vpc.id
  tags = {
    Name = var.private_route_table_az1
  }
}

resource "aws_route_table" "worthai_private_route_table_useast1b" {
  vpc_id = aws_vpc.worthai_vpc.id
  tags = {
    Name = var.private_route_table_az2
  }
}

resource "aws_route_table" "worthai_private_route_table_useast1c" {
  vpc_id = aws_vpc.worthai_vpc.id
  tags = {
    Name = var.private_route_table_az3
  }
}

resource "aws_route" "worthai_private_route_useast1a" {
  route_table_id         = aws_route_table.worthai_private_route_table_useast1a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.worthai_natgw_useast1a.id
}

resource "aws_route" "worthai_private_route_useast1b" {
  route_table_id         = aws_route_table.worthai_private_route_table_useast1b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.worthai_natgw_useast1b.id
}

resource "aws_route" "worthai_private_route_useast1c" {
  route_table_id         = aws_route_table.worthai_private_route_table_useast1c.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.worthai_natgw_useast1c.id
}

###########################################################################

# Associate Public Route Table with Public Subnets

resource "aws_route_table_association" "worthai_public_route_association_useast1a" {
  subnet_id      = aws_subnet.worthai_publicsubnet_useast1a.id
  route_table_id = aws_route_table.worthai_public_route_table.id
}

resource "aws_route_table_association" "worthai_public_route_association_useast1b" {
  subnet_id      = aws_subnet.worthai_publicsubnet_useast1b.id
  route_table_id = aws_route_table.worthai_public_route_table.id
}

resource "aws_route_table_association" "worthai_public_route_association_useast1c" {
  subnet_id      = aws_subnet.worthai_publicsubnet_useast1c.id
  route_table_id = aws_route_table.worthai_public_route_table.id
}

###########################################################################

# Associate Private Route Tables with Private Subnets

resource "aws_route_table_association" "worthai_private_route_association_useast1a" {
  subnet_id      = aws_subnet.worthai_privatesubnet_useast1a.id
  route_table_id = aws_route_table.worthai_private_route_table_useast1a.id
}

resource "aws_route_table_association" "worthai_private_route_association_useast1b" {
  subnet_id      = aws_subnet.worthai_privatesubnet_useast1b.id
  route_table_id = aws_route_table.worthai_private_route_table_useast1b.id
}

resource "aws_route_table_association" "worthai_private_route_association_useast1c" {
  subnet_id      = aws_subnet.worthai_privatesubnet_useast1c.id
  route_table_id = aws_route_table.worthai_private_route_table_useast1c.id
}

###########################################################################

# OUTPUT IDS :::

output "vpc_id" {
  description = "List of public subnet IDs"
  value = [
    aws_vpc.worthai_vpc.id
  ]
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value = [
    aws_subnet.worthai_publicsubnet_useast1a.id,
    aws_subnet.worthai_publicsubnet_useast1b.id,
    aws_subnet.worthai_publicsubnet_useast1c.id
  ]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value = [
    aws_subnet.worthai_privatesubnet_useast1a.id,
    aws_subnet.worthai_privatesubnet_useast1b.id,
    aws_subnet.worthai_privatesubnet_useast1c.id
  ]
}

###########################################################################