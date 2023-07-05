
resource "aws_autoscaling_group" "backend_group1" {
  name                      = "backend-group1"
  launch_template {
    id          = aws_launch_template.backend_template1.id
    version     = "$Latest"
  }
  min_size                  = var.backend_group1_size
  max_size                  = var.backend_group1_size
  desired_capacity          = var.backend_group1_size
   availability_zones    = ["us-west-1a", "us-west-1b"]  #
  # Other configuration options as needed
}

resource "aws_autoscaling_group" "backend_group2" {
  name                      = "backend-group2"
  launch_template {
    id          = aws_launch_template.backend_template2.id
    version     = "$Latest"
  }
  min_size                  = var.backend_group2_size
  max_size                  = var.backend_group2_size
  desired_capacity          = var.backend_group2_size
  availability_zones    = ["us-west-1a", "us-west-1b"]  #
  # Other configuration options as needed
}

