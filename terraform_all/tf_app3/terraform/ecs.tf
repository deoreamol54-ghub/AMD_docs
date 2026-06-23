resource "aws_ecs_task_definition" "backend" {
family                   = "flask-backend"
requires_compatibilities = ["FARGATE"]
network_mode             = "awsvpc"
cpu                      = 256
memory                   = 512

execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

container_definitions = jsonencode([
{
name  = "backend"
image = "${aws_ecr_repository.backend.repository_url}:latest"

```
  portMappings = [{
    containerPort = 5000
    hostPort      = 5000
  }]
}
```

])
}

resource "aws_ecs_task_definition" "frontend" {
family                   = "express-frontend"
requires_compatibilities = ["FARGATE"]
network_mode             = "awsvpc"
cpu                      = 256
memory                   = 512

execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

container_definitions = jsonencode([
{
name  = "frontend"
image = "${aws_ecr_repository.frontend.repository_url}:latest"

```
  portMappings = [{
    containerPort = 3000
    hostPort      = 3000
  }]
}
```

])
}
