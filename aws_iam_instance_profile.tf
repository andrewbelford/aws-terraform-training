resource "aws_iam_instance_profile" "ab_instance_profile" {
  name = "${var.uid}-${var.Env}-ab_instance_profile"
  role = aws_iam_role.ab_instance_role.id
}