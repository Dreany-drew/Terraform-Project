output "load_balancer_dns_name" {
  value = aws_lb.web_lb.dns_name
}

output "asg_name" {
  value = aws_autoscaling_group.web_asg.name
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}
