resource "aws_security_group" "New_SG" {
  name   = "DevOps_sg"
  description = "allowing all traffic"

#  ingress {
#    description = "allowing all"
#    from_port = 0
#    to_port = 0
#    protocol = "tcp"
#    cidr_blocks = var.sg_cidr
#  }
#  egress {
#    from_port = 0
#    to_port = 0
#    protocol = "-1"
#    cidr_blocks = var.sg_cidr
#  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all" {
  security_group_id = aws_security_group.New_SG.id
  cidr_ipv4         = var.sg_cidr
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 0
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.New_SG.id
  cidr_ipv4       = var.sg_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}