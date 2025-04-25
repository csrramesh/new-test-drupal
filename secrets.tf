
locals {
  drupal_secret_values = {
    DB_HOST     = aws_db_instance.drupal.address
    DB_NAME     = var.db_name
    DB_USER     = var.db_user
    DB_PASSWORD = var.db_password
  }
}

resource "aws_secretsmanager_secret" "drupal_db_config" {
  name        = "prod/drupal/db-config-v10"
  description = "Drupal database credentials for ECS"
}

resource "aws_secretsmanager_secret_version" "drupal_db_config_version" {
  secret_id     = aws_secretsmanager_secret.drupal_db_config.id
  secret_string = jsonencode(local.drupal_secret_values)
}
