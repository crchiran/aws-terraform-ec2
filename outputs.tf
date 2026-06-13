output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "ec2_instance_id" {
  value = aws_instance.web_server.id
}

output "ec2_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.web_server.private_ip
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "ec2_key_name" {
  value = aws_key_pair.ec2_key.key_name
}

output "ec2_iam_role_name" {
  value = aws_iam_role.ec2_role.name
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}
