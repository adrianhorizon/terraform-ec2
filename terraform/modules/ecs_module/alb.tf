resource "aws_alb" "main" {
  name            = "${var.nginx_test_name}-load-balancer"
  subnets         = aws_subnet.aws-subnet.*.id
  security_groups = [aws_security_group.aws-lb.id]
  tags = {
    Name = "${var.app_name}-alb"
  }
}

resource "aws_alb_target_group" "nginx_app" {
  name        = "${var.nginx_test_name}-target-group"
  port        = var.krusty_port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.aws-vpc.id
  target_type = "ip"

  health_check {
    healthy_threshold   = 3
    interval            = 300
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = 60
    path                = "/"
    unhealthy_threshold = 10
  }

  tags = {
    Name = "${var.nginx_test_name}-alb-target-group"
  }
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = var.nginx_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.nginx_app.id
    type             = "forward"
  }
}

output "nginx_dns_lb" {
  description = "DNS load balancer"
  value       = aws_alb.main.dns_name
}
