resource "aws_instance" "dev" {
  ami                         = "ami-078c1149d8ad719a7"
  instance_type               = "t2.micro"
  availability_zone           = "ap-southeast-1a"
  vpc_security_group_ids      = [aws_security_group.dev-sg.id]  # Remove the quotes
  key_name                    = "dev1"
  associate_public_ip_address = true
  tags = {
    Name = "dev"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.dev.public_ip} >> /etc/ansible/hosts"
  }
}
