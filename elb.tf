

# classic loadbalancer

resource "aws_elb" "webserver-lb" {
  name               = "webserver-lb"
  internal           = false
  subnets            = [aws_subnet.main-public-01.id, aws_subnet.main-public-02.id]
  security_groups    = [aws_security_group.allow-ssh.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 15
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.websrv-01.id, aws_instance.websrv-02.id]
  cross_zone_load_balancing   = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
      proj      = "webserver"
      terraform = true
      env       = "test"
  }
}

