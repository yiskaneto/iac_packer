variable "aws_region" {
  type    = string
  default = env("AWS_REGION")
}

variable "skip_create_ami" {
  type    = string
  default = env("SKIP_CREATE_AMI")
}

variable "purpose" {
  type = string
}
