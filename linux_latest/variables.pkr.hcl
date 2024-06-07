variable "aws_region" {
  type = string
  default = env("AWS_REGION")
}

variable "sg_id" {
  type    = string
  default = "sg-08094fd0b849d705d" // It has to allow ssh access
}

variable "skip_create_ami" {
  type    = string
  default = env("SKIP_CREATE_AMI")
}

variable "purpose" {
  type    = string
  default = "Linux2023"
}
