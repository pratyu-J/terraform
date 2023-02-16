# create emr_serverless
resource "aws_emrserverless_application" "dqdt_emrServerless" {
  name          = var.emr_serverless_name
  release_label = var.release_label
  type          = var.application_type
  
    initial_capacity {
    initial_capacity_type = "Driver"

    initial_capacity_config {
      worker_count = var.worker_count
      worker_configuration {
        cpu    = var.cpu
        memory = var.memory
      }
    }
  }
}

#resource "null_resource" "copy_script" {
#  provisioner "local-exec" {
#    command = "aws s3 cp s3://us-east-1.elasticmapreduce/emr-containers/samples/wordcount/scripts/wordcount.py s3://demo-bucket-fors3/scripts/"
#  }
#}





