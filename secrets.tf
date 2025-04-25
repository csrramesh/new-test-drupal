
resource "aws_secretsmanager_secret" "drupal_db_config" {
  name        = "prod/drupal/db-config-v8"
  description = "Drupal database credentials for ECS"
}

resource "aws_secretsmanager_secret_version" "drupal_db_config_version" {
  secret_id     = aws_secretsmanager_secret.drupal_db_config.id

  secret_string = jsonencode({
    DB_HOST     = "drupal-db.cluster-xxxxx.ap-southeast-1.rds.amazonaws.com",
    DB_NAME     = var.db_name,
    DB_USER     = var.db_user,
    DB_PASSWORD = var.db_password
  })
}
