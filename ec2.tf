data "aws_ami" "ubuntu_2404" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu_2404.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public[0].id

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  key_name             = aws_key_pair.ec2_key.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = true

  monitoring              = true
  disable_api_termination = var.disable_api_termination
  ebs_optimized           = true

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  user_data = <<-EOF
    #!/bin/bash
    set -euxo pipefail

    export DEBIAN_FRONTEND=noninteractive

    apt-get update
    apt-get upgrade -y
    apt-get install -y nginx

    systemctl enable --now nginx

    echo "Ubuntu 24.04 EC2 created by Terraform" > /var/www/html/index.html
  EOF

  tags = merge(local.common_tags, {
    Name = var.instance_name
  })
}