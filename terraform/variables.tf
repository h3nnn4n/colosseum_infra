variable "hcloud_token" {
  sensitive = true
}

variable "colosseum_worker_count" {
  default = 1
  type = number
}

variable "celery_worker_count" {
  default = 1
  type = number
}

variable "web_worker_count" {
  default = 1
  type = number
}
