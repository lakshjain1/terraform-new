resource "aws_instance" "new" {
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.New_SG.name]
}