#  security group
resource "aws_security_group" "sg_demo" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.in_from_port
    to_port          = var.in_to_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
	  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "allow_tls"
  }
}

# creating ec2 instance
resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  # module.vpc.aws_subnet.public-A.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg_demo.id]
  
ebs_block_device {
	volume_size = var.ebs_volume_size
	volume_type = var.ebs_volume_type
	delete_on_termination = var.delete_on_termination
	device_name = "/dev/xvda"
	}

  tags = {
    Name = var.ec2_name
  }
}
