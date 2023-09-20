variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "ami_id" {
  type    = string
  default = "ami-073e64e4c237c08ad" // Amazon Linux 2023 AMI
}

variable "purpose" {
  type    = string
  default = "demo"
}
