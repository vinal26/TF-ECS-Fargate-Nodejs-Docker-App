resource "aws_ecs_task_definition" "this" {
  family                   = "sample_api"
  memory                   = 512
  cpu                      = 256
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task.arn
  execution_role_arn       = aws_iam_role.task.arn
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [{
      "name" : "nodejs-app-container"
      "image" : "public.ecr.aws/c2j2w5p7/test-nodejs-app:v1",
      "portMappings" : [
        { containerPort = 80 }
      ],
    }]
  )
}
