locals {
  port = 8080
}

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 6.0"

  cluster_name = "${var.environment}-website-service"

  # Fargate capacity providers
  default_capacity_provider_strategy = {
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }

  # Services
  services = {
    website-service = {
      cpu    = 0.25 * 1024 # 0.25 vCPU * 1024 for Units
      memory = 512         # MiB

      create_security_group = true

      security_group_ingress_rules = {
        service = {
          description = "Service port"
          from_port   = local.port
          ip_protocol = "tcp"
          cidr_ipv4   = "0.0.0.0/0"
        }
      }

      security_group_egress_rules = {
        all = {
          ip_protocol = "-1"
          cidr_ipv4   = "0.0.0.0/0"
        }
      }

      create_task_exec_iam_role = false
      task_exec_iam_role_arn    = data.aws_iam_role.website_service_task_exec_role.arn


      create_tasks_iam_role = false
      tasks_iam_role_arn    = data.aws_iam_role.website_service_task_role.arn

      # Container definition
      container_definitions = {
        http-echo = {
          image     = "hashicorp/http-echo:latest"
          essential = true

          port_mappings = [{
            name          = "http-echo"
            containerPort = local.port
            hostPort      = local.port
            protocol      = "tcp"
          }]

          command = [
            "-listen=:${local.port}",
            "-text=Hello, Wizards!",
          ]

          log_configuration = {
            logDriver = "awslogs"

            options = {
              awslogs-group         = aws_cloudwatch_log_group.ecs_log_group.name
              awslogs-region        = data.aws_region.current.region
              awslogs-stream-prefix = "ecs"
            }
          }
        }
      }

      # Network configuration
      subnet_ids       = data.aws_subnets.public.ids
      assign_public_ip = true
    }
  }

  tags = {
    Service = "website-service"
  }
}
