data "template_file" "nginx_app" {
  template = file("${path.module}/templates/nginx.json")
  vars = {
    app_name       = var.nginx_test_name
    app_image      = var.nginx_image
    app_port       = var.nginx_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
  }
}

resource "aws_ecs_task_definition" "nginx_app" {
  family                   = "app-task"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.nginx_app.rendered

}

resource "aws_ecs_service" "nginx_app" {
  name            = var.nginx_test_name
  cluster         = aws_ecs_cluster.aws-ecs.id
  task_definition = aws_ecs_task_definition.nginx_app.arn
  desired_count   = var.nginx_count
  launch_type     = "FARGATE"
  network_configuration {
    security_groups  = [aws_security_group.aws-ecs-tasks.id]
    subnets          = aws_subnet.aws-subnet.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.nginx_app.id
    container_name   = var.nginx_test_name
    container_port   = var.nginx_port
  }

  depends_on = [aws_alb_listener.front_end]

  tags = {
    Name = "${var.nginx_test_name}-nginx-ecs"
  }
}
