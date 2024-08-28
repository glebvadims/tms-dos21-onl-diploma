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
