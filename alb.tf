resource "aws_lb" "alb-tf" {
  name               = "alb-tf"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = [aws_security_group.allow-http.id]
  subnets            = data.aws_subnets.vpc_subnets.ids

}

resource "aws_lb_target_group" "alb-target-group" {
  name        = "alb-target-group-tf"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.default-vpc.id

  health_check {
    enabled             = true
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 8
    healthy_threshold   = 5
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "alb-tf" {
  load_balancer_arn = aws_lb.alb-tf.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }
}

resource "aws_lb_target_group_attachment" "instance-1" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.instance-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "instance-2" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.instance-2.id
  port             = 80
}