resource "aws_lb" "this" {
  name               = "${var.name_prefix}-lb"
  internal           = var.internal
  load_balancer_type = var.type_of_lb
  security_groups    = var.security_groups
  subnets            = var.subnets_of_vpc
}

resource "aws_lb_target_group" "this" {
  name     = "${var.name_prefix}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "this" {
  count            = length(var.target_of_instance)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_of_instance[count.index]
  port             = 80
}
