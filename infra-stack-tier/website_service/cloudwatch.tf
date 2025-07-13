# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/${var.environment}-hello-world-service"
  retention_in_days = 7

  tags = {
    Service = "website-service"
  }
}
