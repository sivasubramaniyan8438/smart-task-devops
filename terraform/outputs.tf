output "public_ip" {
  value = aws_instance.tools.public_ip
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/stms-key ubuntu@${aws_instance.tools.public_ip}"
}
