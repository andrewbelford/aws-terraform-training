variable "ssh_public_key_location" {
  description = "Where is your public key, I will read it from a file. Example: ~/.ssh/id_rsa.pub"
  default = "id_rsa.pub"
}

resource "aws_key_pair" "usersshkey" {
  public_key = file(var.ssh_public_key_location)
  tags = local.common_tags
  key_name_prefix = var.uid
}
