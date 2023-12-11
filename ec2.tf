resource "aws_instance" "instance-1" {
  ami                    = data.aws_ami.amazon_ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-http.id]
  user_data              = <<-EOF
		#! /bin/bash
    sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
		echo "<h1>Deployed via Terraform 1</h1>" | sudo tee /var/www/html/index.html
              EOF
  tags = {
    Name = "instance-1"
  }
}

resource "aws_instance" "instance-2" {
  ami                    = data.aws_ami.amazon_ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-http.id]
  user_data              = <<-EOF
		#! /bin/bash
    sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
		echo "<h1>Deployed via Terraform 2</h1>" | sudo tee /var/www/html/index.html
              EOF
  tags = {
    Name = "instance-2"
  }
}