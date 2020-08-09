locals {
  common_tags = {
    "Terraform"   = "true"
    "Automation"  = "Terraform::state=s3://bucket/key+url=gitrepourl"
    "Environment" = var.Env
    "Owner"       = var.owner
    "chargeto"    = "Lab Auckland"
  }
}