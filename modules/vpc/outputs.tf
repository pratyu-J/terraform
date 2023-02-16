output "vpcId" {
    value = resource.aws_vpc.main.id
}

output "pub_subnet_id" {
    value = resource.aws_subnet.public-A.id
}

output "prv_subnet_id" {
	value = resource.aws_subnet.private-A.id
}

output "pub_rt_id" {
	value = resource.aws_route_table.publicRT.id
}

output "prvt_rt_id" {
	value = resource.aws_route_table.privateRT.id
}