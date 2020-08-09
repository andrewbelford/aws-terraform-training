data "aws_availability_zones" "available" { 
  state = "available"
}
data "aws_region" "current" {}
data "aws_canonical_user_id" "current" {}
output "AvailabilityZones" {
  value = data.aws_availability_zones.available.names
}
output "ProviderRegionName" {
  value = data.aws_region.current.name
}
output "ProviderRegionEndpoint" {
  value = data.aws_region.current.endpoint
}