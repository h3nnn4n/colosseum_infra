variable "hcloud_token" {
  sensitive = true
  type      = string
}

variable "colosseum_worker_type" {
  default = "cpx11"
  type = string
}

variable "colosseum_worker_count" {
  default = 1
  type = number
}

variable "celery_worker_type" {
  default = "cpx11"
  type = string
}

variable "celery_worker_count" {
  default = 1
  type = number
}

variable "web_worker_type" {
  default = "cpx11"
  type = string
}

variable "web_worker_count" {
  default = 1
  type = number
}

variable "base_image" {
  default = "ubuntu-20.04"
  type = string
}

variable "database_worker_type" {
  default = "cpx21"
  type = string
}

variable "postgres_volume_size" {
  default = 20
  type    = number
  description = "Size of the Postgres volume in GB"
}

variable "postgres_volume_name" {
  default = "postgres-data"
  type    = string
  description = "Name of the Postgres volume"
}
