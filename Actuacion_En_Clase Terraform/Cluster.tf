resource "aws_ecs_cluster" "cluster_terraform" {
  name = "terraform_cluster"
  capacity_providers = ["FARGATE"]
  setting {
    name = "containerInsights"
    value = "disabled"
  }
}