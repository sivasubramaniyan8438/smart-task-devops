variable "region" {
  default = "ap-south-1"
}

variable "aws_profile" {
  default = "stms"
}

variable "instance_type" {
  default = "c7i-flex.large"
}

variable "public_key_path" {
  default = "~/.ssh/stms-key.pub"
}
