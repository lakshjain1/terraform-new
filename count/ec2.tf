resource "aws_instance" "new" {
    # count = 4
    ami = data.aws_ami.Dev_Ops.id
    instance_type = var.instance_type
    # tags = {
    #     Name = var.intance_names[count.index]
    # }   
}

# resource "aws_route53_record" "record" {
#     count = 4
#   zone_id = var.zone_id
#   name    = "${var.intance_names[count.index]}.${var.domain}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.new[count.index].private_ip]
# }

resource "aws_security_group" "allow_ssh" {
  name = "allow-shh"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_all" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = var.sg_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4       = var.sg_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}