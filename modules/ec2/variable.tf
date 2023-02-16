# security group configs

variable "vpc_id" {}
variable "in_from_port" {}
variable "in_to_port" {}
variable "cidr_blocks" {}
variable "egress_from_port" {}
variable "egress_to_port" {}

# ec2 configs

variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_id" {}
variable "ebs_volume_size" {}
variable "ebs_volume_type" {}
variable "delete_on_termination" {
		default = true
		}
variable "device_name" {
		default = "/dev/xvda"
		}
variable "ec2_name" {}