# vpc configs
vpc_cidr_block = "10.200.0.0/16"
vpc_name = "main"

# subnets
public_subnet_cidr = "10.200.1.0/24"
private_subnet_cidr = "10.200.0.0/24"
publicRT_cidr = "0.0.0.0/0"

# security group configs
in_from_port = 22
in_to_port =  22

# ec2
ami = "ami-01cae1550c0adea9c"
instance_type = "t2.micro"
key_name = "dqdtDemoKeypair"
#vpc_sg_ids = ["sg-0cbf71212e731dcc5"]
ebs_volume_size = "8"
ebs_volume_type = "gp2"
delete_on_termination = "true"
ec2_name = "TerraformEc2Instance01"

# s3
bucket = "demo-bucket-fors3"

# sqs 
sqs_name = "sqs-queue-terra"
delay_seconds = 0
max_message_size = 2048
message_retention_seconds = 86400
receive_wait_time_seconds = 0


#emr serverless
emr_serverless_name = "dqdt_application"
worker_count = 1
cpu = "2 vCPU"
memory = "10 GB"
