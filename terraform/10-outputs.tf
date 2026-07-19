output "ec2_public_ip" {
  description = "Public IP of Jenkins EC2"
  value       = aws_instance.jenkins.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of Jenkins EC2"

  value = aws_instance.jenkins.public_dns
}

