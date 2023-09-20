variable "aws_region" {
  type    = string
}


variable "ami_id" {
  type    = string
  default = "ami-073e64e4c237c08ad" // Amazon Linux 2023 AMI
}

variable "app_name" {
  type    = string
  default = "general-use"
}
