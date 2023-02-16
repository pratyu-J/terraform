resource "aws_s3_bucket" "demos3" {
    bucket = "${var.bucket}" 
    acl = "${var.acl_value}"   
      versioning {
        enabled = false
    }
}