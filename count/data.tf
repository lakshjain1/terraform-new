data "aws_ami" "Dev_Ops" {
    most_recent = true

    filter {
      name = "name"
      values = ["Centos-8-DevOps-Practice"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["973714476881"]
}

data "aws_vpc" "default" {
    default = true
}