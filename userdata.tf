data "template_file" "config" {
  template = file("cloudinit/cloud-config.tpl")
  vars = {
    owner = var.owner
  }
}

data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.config.rendered
  }
  part {
    content_type = "text/x-shellscript"
    content      = file("cloudinit/script-example.txt")
  }
}