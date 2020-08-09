variable "uid" {
  description = "a unique username without spaces, which we need for these labs because resource not specific to a VPC will otherwise have naming conflicts. I will be using my initials in lower case: go"
}
variable "Env" {
  default = "lab"
}
variable "owner" {
}

variable "ssh_source_cidr" {
}

variable "webservercount" {
default = "1"
}
