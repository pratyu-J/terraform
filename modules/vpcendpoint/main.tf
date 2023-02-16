# creating vpc s3 endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.s3"
  
  tags = {
	Name = "s3-endpoint"
  }
}

resource "aws_vpc_endpoint_route_table_association" "vpcePrivateRT" {
  route_table_id  = var.route_table_id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

# creating vpc sqs endpoint
resource "aws_vpc_endpoint" "sqs" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.sqs"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    var.security_grp
  ]
  
  tags = {
	Name = "sqs-endpoint"
  }
}

# associating private subnet with sqs vpc
resource "aws_vpc_endpoint_subnet_association" "sn_ec2" {
  vpc_endpoint_id = aws_vpc_endpoint.sqs.id
  subnet_id       = var.subnet_id
}