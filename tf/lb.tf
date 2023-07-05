resource "aws_lb" "load_balancer" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-0e7d3d1707b706726", "subnet-0526aede4a316dd8d"]  

  # Other configuration options as needed
}

resource "aws_lb_target_group" "backend_group1" {
  name        = "backend-group1-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "vpc-0be05ad4e543a3311" 
  target_type = "instance"

  # Other configuration options as needed
}

resource "aws_lb_target_group" "backend_group2" {
  name        = "backend-group2-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "vpc-0be05ad4e543a3311"  
  target_type = "instance"

  # Other configuration options as needed
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"


  # Path-based routing to backend_group2
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_group2.arn
#    condition {
#      field  = "path-pattern"
#      values = ["/page2.html"]
#    }
  }
}

