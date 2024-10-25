resource "aws_db_parameter_group" "main" {
  name   = "${var.env}-mysql-rds"
  family = "mysql5.7"
  tags   = merge(var.tags, { Name = "${var.env}-mysql-rds" })
}
