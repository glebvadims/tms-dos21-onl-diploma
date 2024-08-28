variable "project_id" {
  type        = string
  description = "The GCP project ID."
  default     = "tms21-432012"
}

variable "region" {
  type        = string
  description = "The GCP region."
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The GCP zone."
  default     = "us-central1-a"
}

variable "ip_static" {
  description = "Имя статического IP-адреса"
  type        = string
  default     = "34.30.80.224"
}