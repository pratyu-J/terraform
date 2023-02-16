variable "sqs_name" {}
variable "delay_seconds" {}
variable "max_message_size" {}
variable "message_retention_seconds" {}
variable "receive_wait_time_seconds" {}
variable "sqs_managed_sse_enabled" {
	default = false
	}