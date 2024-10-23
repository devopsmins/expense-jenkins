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

resource "aws_lb_listener" "main"





resource "aws_lb_listener" "main" {
  count             = var.enable_https ? 0 : 1
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}
resource "aws_lb_listener" "https" {
  count             = var.enable_https ? 1 : 0
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn


  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.mian.arn
  count             = var.enable_https ? 1 : 0
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certicate_arn     = var.certificate_arn

}







