data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ab_instance_role" {
  name               = "${var.uid}-${var.Env}-instance_role"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}
  #tags               = local.common_tags
