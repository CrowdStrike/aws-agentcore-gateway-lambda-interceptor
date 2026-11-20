resource "aws_secretsmanager_secret" "aidr_token" {
  name        = "aidr/interceptor/api-token"
  description = "CrowdStrike AIDR bearer token for the AgentCore interceptor Lambda. Populate manually after deploy: aws secretsmanager put-secret-value --secret-id aidr/interceptor/api-token --secret-string '<token>'"
  tags        = var.tags
}
