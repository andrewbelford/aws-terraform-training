resource "aws_instance" "webservers" {
  count = var.webservercount
  ami                         = element(data.aws_ami_ids.centos7.ids,0)
  iam_instance_profile = aws_iam_instance_profile.ab_instance_profile.id
  ebs_optimized = false
  instance_type = "t2.nano"
  monitoring    = false
  key_name      = aws_key_pair.usersshkey.key_name
  #subnet_id     = element(module.vpc.public_subnets, 0)
  subnet_id  = element(module.vpc.public_subnets,count.index % 2)
  vpc_security_group_ids      = [aws_security_group.webserver.id]
  tags = merge(local.common_tags,{"Name" = "${var.uid}-myserver"})
  associate_public_ip_address = true
  source_dest_check           = true
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }
  user_data = data.template_cloudinit_config.config.rendered
}

resource "aws_security_group" "webserver" {
    description = "Security group for webserver"
    name = "abelford-webserver-sg"
    vpc_id      = module.vpc.vpc_id

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = [var.ssh_source_cidr]
        #cidr_blocks     = [local.mycidr]
    }

    ingress {
        from_port       = 25
        to_port         = 25
        protocol        = "tcp"
        cidr_blocks     = [var.ssh_source_cidr]
        #cidr_blocks     = [local.mycidr]
    }

 ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        #security_groups = [aws_security_group.webserver-alb.id]
        cidr_blocks     = ["203.86.193.176/32"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    tags = local.common_tags
 }

#resource "aws_route53_record" "webserver" {
#  zone_id = data.aws_route53_zone.lab.zone_id
#  name    = "${var.uid}-webserver.${data.aws_route53_zone.lab.name}"
#  type    = "A"
#  ttl     = "10"
#  records = [aws_instance.webservers.public_ip]
#}

#resource "aws_route53_record" "webserver" {
#  zone_id = data.aws_route53_zone.lab.zone_id
#  name    = "${var.uid}-webserver.${data.aws_route53_zone.lab.name}"
#  type    = "A"
#  alias {
#    name                   = aws_alb.webserver.dns_name
#    zone_id                = aws_alb.webserver.zone_id
#    evaluate_target_health = false
#  }
#}

