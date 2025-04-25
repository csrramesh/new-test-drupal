
output "alb_dns_name" {
  value = aws_lb.drupal_alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.drupal.address
}

output "cluster_name" {
  value = aws_ecs_cluster.drupal.name
}
