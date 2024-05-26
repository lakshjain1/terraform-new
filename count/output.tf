output "public_ip" {
    value = aws_instance.new[*].public_ip
}

output "vpc_info" {
  value = data.aws_vpc.default
}