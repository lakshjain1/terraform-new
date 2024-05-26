output "public_ip" {
    value = aws_instance.new[*].public_ip
}
