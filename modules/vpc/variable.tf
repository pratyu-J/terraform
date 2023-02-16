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
