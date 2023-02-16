output "vpc_id" {
    value = module.vpc.vpcId
}

output "public_subnet_id" {
    value = module.vpc.pub_subnet_id
}

output "private_subnet_id" {
	value = module.vpc.prv_subnet_id
}

output "public_rt_id" {
  value = module.vpc.pub_rt_id
}

output "private_rt_id" {
	value = module.vpc.prvt_rt_id
}

output "security_grp" {
	value = module.ec2.securityGrpId
}