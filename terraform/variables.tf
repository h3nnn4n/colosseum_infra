variable "hcloud_token" {
  sensitive = true
  type      = string
}

variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region for resources"
}

variable "aws_access_key" {
  sensitive   = true
  type        = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  sensitive   = true
  type        = string
  description = "AWS secret key"
}

variable "colosseum_worker_type" {
  default = "cpx11"
  type    = string
}

variable "colosseum_worker_count" {
  default = 1
  type    = number
}

variable "celery_worker_type" {
  default = "cpx11"
  type    = string
}

variable "celery_worker_count" {
  default = 1
  type    = number
}

variable "web_worker_type" {
  default = "cpx11"
  type    = string
}

variable "web_worker_count" {
  default = 1
  type    = number
}

variable "staging_count" {
  default = 1
  type    = number
}

variable "staging_type" {
  default = "cpx11"
  type    = string
}

variable "base_image" {
  default = "ubuntu-24.04"
  type    = string
}

variable "database_worker_type" {
  default = "cpx21"
  type    = string
}

variable "postgres_volume_size" {
  default     = 20
  type        = number
  description = "Size of the Postgres volume in GB"
}

variable "postgres_volume_name" {
  default     = "postgres-data"
  type        = string
  description = "Name of the Postgres volume"
}
