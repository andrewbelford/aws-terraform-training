module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  name                    = "${var.uid}-training-vpc"
  cidr                    = "10.213.0.0/16"
  public_subnets          = ["10.213.111.0/24"]
  map_public_ip_on_launch = true
  enable_nat_gateway      = false
  enable_dns_hostnames    = true
  enable_dns_support      = true
  azs                     = data.aws_availability_zones.available.names
  tags                    = local.common_tags
}
