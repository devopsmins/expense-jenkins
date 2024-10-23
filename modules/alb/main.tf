resource "aws_security_group" "main" {
  name = "${var.env}-${var.type}-alb"
  description = "${var.env}-${var.type}-alb"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = "var.ingress"

    content {
      description = "APP"
      from_port = ingress.value["port"]
      to_port = ingress.value["port"]
      protocol =tcp
      cidr_block = var.sg_cidrs
    }
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = ["0.0.0.0/0"]
    ipv6_cidr_block = ["::/0"]


  }
  tags = merge(var.tags, { Name = "${var.env}-${var.component}" })

}

resource "aws_lb" "main" {
  name              = "${var.env}-${var.type}"
  internal          = var.internal
  load_balance_type = "application"
  security_groups   = [aws_security_group.main.id]
  subnets           = var.subnets
  tags              = merge(var.tags, { Name = "${var.env}-${var.type}-alb" })
}








resource "aws_security_group" "main" {
  name        = "${var.env}-${var.type}-alb"
  description = "${var.env}-${var.type}-alb"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress
    content {
      description = "APP"
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = "tcp"
      cidr_blocks = var.sg_cidrs
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags, { Name = "${var.env}-${var.component}" })
}