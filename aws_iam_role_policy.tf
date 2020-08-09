resource "aws_iam_role_policy" "test_policy" {
  name = "${var.uid}-${var.Env}-test_policy"
  role = aws_iam_role.ab_instance_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}