# vpc 
variable "vpc_cidr_block" {}
variable "vpc_name" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "publicRT_cidr" {
	default = "0.0.0.0/0"
	}
variable "region" {
    default = "eu-west-1"
}

# security group configs
variable "in_from_port" {}
variable "in_to_port" {}

variable "egress_from_port" {
	default = 0
	}
variable "egress_to_port" {
	default = 0
	}

# ec2 configs
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}

variable "ebs_volume_size" {}
variable "ebs_volume_type" {}
variable "delete_on_termination" {
		default = true
		}
variable "device_name" {
		default = "/dev/xvda"
		}
variable "ec2_name" {}

# s3

variable "bucket" {}
variable "acl_value" {
    default = "private"
}

#sqs
variable "sqs_name" {}
variable "delay_seconds" {}
variable "max_message_size" {}
variable "message_retention_seconds" {}
variable "receive_wait_time_seconds" {}
variable "sqs_managed_sse_enabled" {
	default = false
	}
	
# emr serverless
variable "emr_serverless_name" {}
variable "release_label" {
	default = "emr-6.6.0"
	}
variable "application_type" {
	default = "spark"
	}
variable "worker_count" {}
variable "cpu" {}
variable "memory" {}