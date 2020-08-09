data "aws_iam_policy_document" "snap" {
  statement {
    sid = "1"
    actions = [
      "ec2:*Snapshot*",
      "ec2:Describe*"
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ab_iam_policy" {
  name   = "${var.uid}-${var.Env}-terraformed-snapshop-ab_iam_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.snap.json
}