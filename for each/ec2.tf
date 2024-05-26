resource "aws_instance" "roboshop" {
  for_each = var.instnaces
  ami = var.ami_id
  instance_type = each.value
  tags = {
    Name = each.key
  }
}

# if web public Ip else private Ip
resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}