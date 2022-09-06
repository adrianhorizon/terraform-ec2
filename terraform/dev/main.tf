module "key_pair" {
  source      = "../modules/key_pair/"
  environment = "dev"
}

module "ec2" {
  source = "../modules/ecs_module/"

  vpc_cidr            = "172.33.0.0/16"
  app_name            = "krusty-test"
  app_environment     = "krusty"
  aws_region          = "us-east-1"
  app_sources_cidr    = ["0.0.0.0/0"]
  admin_sources_cidr  = ["0.0.0.0/0"]
  aws_key_pair_name   = "test-pem-dev"
  nginx_image         = "nginx:alpine"
  krusty_port         = 8080
  nginx_port          = 80
  nginx_count         = 2
  fargate_cpu         = "1024"
  fargate_memory      = "2048"
  type_instance_count = "1"
  nginx_test_name     = "dev"
  type_instance       = "c5a.large"
  krusty_environment  = "dev"
}
