terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
    region = "${var.region}"
}



module "vpc" {
	source = "./modules/vpc"
	vpc_name = var.vpc_name
	vpc_cidr_block = var.vpc_cidr_block
	public_subnet_cidr = var.public_subnet_cidr
	private_subnet_cidr = var.private_subnet_cidr
	publicRT_cidr = var.publicRT_cidr
		
}

module "iam" {
	source = "./modules/iam"
	bucket = var.bucket
}


module "ec2" {
	source = "./modules/ec2"
	vpc_id = module.vpc.vpcId
	cidr_blocks = [var.vpc_cidr_block]
	in_from_port = var.in_from_port
	in_to_port = var.in_to_port
	egress_from_port = var.egress_from_port
	egress_to_port = var.egress_to_port
	
	ami = var.ami
	instance_type = var.instance_type
	subnet_id = module.vpc.pub_subnet_id
	key_name = var.key_name
	
	ebs_volume_size = var.ebs_volume_size
	ebs_volume_type = var.ebs_volume_type
	delete_on_termination = var.delete_on_termination
	device_name = var.device_name
	ec2_name = var.ec2_name
}

module "vpcendpoint" {
	source = "./modules/vpcendpoint"
	vpc_id = module.vpc.vpcId
	route_table_id = module.vpc.prvt_rt_id
	security_grp = module.ec2.securityGrpId
	subnet_id = module.vpc.prv_subnet_id
}

module "sqs" {
	source = "./modules/sqs"
	sqs_name = var.sqs_name
	delay_seconds = var.delay_seconds
	max_message_size = var.max_message_size
	message_retention_seconds = var.message_retention_seconds
	receive_wait_time_seconds = var.receive_wait_time_seconds
	sqs_managed_sse_enabled = var.sqs_managed_sse_enabled
}

module "s3" {
    source = "./modules/s3"
    #bucket name should be unique
    bucket = var.bucket       
} 



module "emrserverless" {
	source = "./modules/emrserverless"
	emr_serverless_name = var.emr_serverless_name
	release_label = var.release_label
	application_type = var.application_type
	worker_count = var.worker_count
	cpu = var.cpu
	memory = var.memory
}


