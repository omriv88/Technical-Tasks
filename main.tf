locals {
  vpc_id = "vpc-040fad6c929af6d8c"
  subnet_id = "subnet-0a7d1523f8cca78fa"
  ssh_user = "ec2-user"
  key_name = "wordpress"
  private_key_path = "/root/workspace/deploy-demo/test/wordpress.pem"

}

provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "wordpress" {
  name   = "wordpress_access"
  vpc_id = local.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "wordpress" {
  ami                         = "ami-02b972fec07f1e659"
  subnet_id                   = "subnet-0a7d1523f8cca78fa"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.wordpress.id]
  key_name                    = local.key_name

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.wordpress.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.wordpress.public_ip}, --private-key ${local.private_key_path} wordpress.yaml"
  }
}

output "wordpress_ip" {
  value = aws_instance.wordpress.public_ip
}
