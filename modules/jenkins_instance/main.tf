# Generate an SSH private key
resource "tls_private_key" "jenkins_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a key pair in AWS using the public part of the key
resource "aws_key_pair" "jenkins_key" {
  key_name   = "jenkins-key"
  public_key = tls_private_key.jenkins_key.public_key_openssh
}

# Save the private key locally for SSH use
resource "local_file" "private_key" {
  filename        = "${path.module}/jenkins-key.pem"
  content         = tls_private_key.jenkins_key.private_key_pem
  file_permission = "0400"
}

# Launch Jenkins EC2 instance
resource "aws_instance" "jenkins_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.enable_public_ip_address

  key_name = aws_key_pair.jenkins_key.key_name
  user_data = var.user_data_install_jenkins
  tags = {
    Name = "jenkins-instance"
  }
}
