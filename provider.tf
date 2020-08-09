#variable "AWS_REGION" {
#  description = "The region can be set from the OS env var TF_VAR_AWS_REGION, via terraform.tfvars or via a default"
#  default = "us-west-2"
#}
provider "aws" {
#  profile = "oss"
#  region  = var.AWS_REGION
  assume_role {
    role_arn = "arn:aws:iam::085032814280:role/OSS_Terraform_no_MFA"
  }
}

