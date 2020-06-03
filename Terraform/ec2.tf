provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "practice" {
  ami = data.aws_ami.ami.image_id
  instance_type = "t2.micro"
  key_name = "practice"
  tags = {
    Name  = "practice"
  }

  provisioner "remote-exec" {
    connection {
      type = ssh
      host = self.private_ip
      user = "centos"
      private_key = file("/home/centos/.ssh/id_rsa")
    }
    inline = [
      "yum install ansible -y"
    ]
  }
}

data "aws_ami" "ami" {
  owners = ["679593333241"]
  name_regex = "^CentOS Linux 7"
  most_recent = true
}
