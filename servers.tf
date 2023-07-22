data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "jenkins-server" {
  ami                         = "ami-0e820afa569e84cc1"
  instance_type               = var.instance_type_jenkins
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.myapp-subnet.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone_a
  associate_public_ip_address = true
  user_data                   = file("jenkins-script.sh")
  tags = {
    Name = "${var.env_prefix}-jenkins"
  }
}

resource "aws_instance" "docker-server" {
  ami                         = "ami-0e820afa569e84cc1"
  instance_type               = var.instance_type_docker
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.myapp-subnet.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone_a
  associate_public_ip_address = true
  user_data                   = file("docker-script.sh")
  tags = {
    Name = "${var.env_prefix}-docker"
  }
}

resource "aws_instance" "nexus-server" {
  ami                         = "ami-0e820afa569e84cc1"
  instance_type               = var.instance_type_nexus
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.myapp-subnet.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone_a
  associate_public_ip_address = true
  user_data                   = file("nexus-script.sh")
  tags = {
    Name = "${var.env_prefix}-nexus"
  }
}

resource "aws_instance" "sonarqube-server" {
  ami                         = "ami-0e820afa569e84cc1"
  instance_type               = var.instance_type_sonarqube
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.myapp-subnet.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone_a
  associate_public_ip_address = true
  user_data                   = file("sonarqube-script.sh")
  tags = {
    Name = "${var.env_prefix}-sonar"
  }
}
