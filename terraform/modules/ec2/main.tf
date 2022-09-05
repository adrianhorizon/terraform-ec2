variable "aws_access_key" {
  sensitive = true
}

variable "aws_secret_key" {
  sensitive = true
}

variable "ami_id" {
  default = ""
}

variable "domain" {
  default = ""
}
