########################################################
# Get Latest Amazon Linux 2023 AMI
########################################################

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

########################################################
# EC2 Instance
########################################################

resource "aws_instance" "jenkins" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.small"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.jenkins.id
  ]

  key_name = "jenkins-key-v2"

  tags = {
    Name = "jenkins-server"
  }
}

