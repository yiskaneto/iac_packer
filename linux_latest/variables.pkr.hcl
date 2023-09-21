variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "ami_id" {
  type    = string
  default = "ami-073e64e4c237c08ad" // Amazon Linux 2023 AMI
}

variable "sg_id" {
  type    = string
  default = "sg-08094fd0b849d705d" // It has to allow ssh access
}

variable "skip_create_ami" {
  type    = string
  default = env("CREATE_AMI")
}

variable "purpose" {
  type    = string
  default = "Linux2023"
}
