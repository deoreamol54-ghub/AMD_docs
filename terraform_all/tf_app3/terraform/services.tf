resource "aws_ecs_service" "frontend" {
name            = "frontend-service"
cluster         = aws_ecs_cluster.main.id
task_definition = aws_ecs_task_definition.frontend.arn
desired_count   = 1
launch_type     = "FARGATE"

network_configuration {
subnets = [
aws_subnet.public_a.id,
aws_subnet.public_b.id
]

```
assign_public_ip = true
security_groups = [
  aws_security_group.alb.id
]
```

}

load_balancer {
target_group_arn = aws_lb_target_group.frontend.arn
container_name   = "frontend"
container_port   = 3000
}

depends_on = [
aws_lb_listener.http
]
}
