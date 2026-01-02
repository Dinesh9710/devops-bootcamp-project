# Server 1 – Web Server
resource "aws_instance" "web_server" {
  ami                    = "ami-00d8fc944fb171e29"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  private_ip             = "10.0.0.5" 
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  tags                   = { Name = "Web-Server" }
}

# Elastic IP for the Web Server
resource "aws_eip" "web_eip" {
  instance = aws_instance.web_server.id
  domain   = "vpc"
}

# Server 2 – Ansible Controller
resource "aws_instance" "ansible_controller" {
  ami                    = "ami-00d8fc944fb171e29"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.135" 
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  tags                   = { Name = "Ansible-Controller" }
}

# Server 3 – Monitoring Server
resource "aws_instance" "monitoring_server" {
  ami                    = "ami-00d8fc944fb171e29"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.136" 
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  tags                   = { Name = "Monitoring-Server" }
}