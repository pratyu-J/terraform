resource "aws_sqs_queue" "terraform_queue" {
  name                      = var.sqs_name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = 0
  sqs_managed_sse_enabled = var.sqs_managed_sse_enabled
  tags = {
    name = "queue"
  }
}