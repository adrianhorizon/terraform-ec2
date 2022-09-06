resource "aws_security_group" "aws-lb" {
  name        = "${var.nginx_test_name}-load-balancer"
  description = "${var.nginx_test_name}"
  vpc_id      = aws_vpc.aws-vpc.id
  ingress {
    protocol    = "tcp"
    from_port   = var.nginx_port
    to_port     = var.nginx_port
    cidr_blocks = var.app_sources_cidr
  }
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.nginx_test_name}-alb-sg"
  }
}

resource "aws_security_group" "aws-ecs-tasks" {
  name        = "${var.nginx_test_name}-ecs-tasks"
  description = "Allow inbound access from the ALB only"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    protocol        = "tcp"
    from_port       = var.nginx_port
    to_port         = var.nginx_port
    security_groups = [aws_security_group.aws-lb.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.nginx_test_name}-ecs-tasks"
  }
}

resource "aws_security_group" "ec2-sg" {
  name        = "${var.krusty_environment}-ec2-sg"
  description = "allow all"
  vpc_id      = aws_vpc.aws-vpc.id
  dynamic "ingress" {
    for_each = toset(local.ports_in)
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  ingress {
    protocol    = "tcp"
    from_port   = 0
    to_port     = 65535
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "${var.krusty_environment}-ec2-sg"
  }
}
