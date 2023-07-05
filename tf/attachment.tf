resource "aws_autoscaling_attachment" "attachment" {
  autoscaling_group_name = aws_autoscaling_group.backend_group1.name
  lb_target_group_arn   = aws_lb_target_group.backend_group1.arn
}

resource "aws_autoscaling_attachment" "attachment2" {
  autoscaling_group_name = aws_autoscaling_group.backend_group2.name
  lb_target_group_arn   = aws_lb_target_group.backend_group2.arn
}
