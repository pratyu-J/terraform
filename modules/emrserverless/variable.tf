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