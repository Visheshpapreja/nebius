variable "aws_region" {
  description = "AWS region"
  default     = "us-west-1"  # Change to your desired region
}

variable "backend_group1_size" {
  description = "Number of instances in backend group 1"
  default     = 1
}

variable "backend_group2_size" {
  description = "Number of instances in backend group 2"
  default     = 1
}

