resource "aws_security_group" "roboshop" {
  name   = "roboshop_sg"
  description = "allowing http https ssh"

 dynamic ingress {
  for_each = var.ingress
  content {
   description = ingress.value.description
   from_port = ingress.value.from_port
   to_port = ingress.value.to_port
   protocol = ingress.value.protocol
   cidr_blocks = ingress.value.cidr_blocks
  }

 }
 egress {
   from_port = 0 
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
   name = "roboshop_allow"
 }
}

# resource "aws_vpc_security_group_ingress_rule" "allow_all" {
#   security_group_id = aws_security_group.New_SG.id
#   cidr_ipv4         = var.sg_cidr
#   from_port         = 0
#   ip_protocol       = "tcp"
#   to_port           = 0
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.New_SG.id
#   cidr_ipv4       = var.sg_cidr
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }
