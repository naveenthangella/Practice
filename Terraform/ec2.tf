provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "practice" {
  ami = data.aws_ami.ami.image_id
  instance_type = "t2.micro"
  key_name = "practice"
  security_groups = [data.aws_security_group.sg.id]
  tags = {
    Name  = "practice"
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      host = self.private_ip
      user = "centos"
      private_key = file("/home/centos/.ssh/id_rsa")
    }
    inline = [
      "yum install ansible -y"
    ]
  }
}
data "aws_security_group" "sg" {
  filter {
    name = "groupName"
    values = ["CentOS 7 -x86_64- - with Updates HVM-2002_01-AutogenByAWSMP-"]
  }
}

data "aws_ami" "ami" {
  owners = ["679593333241"]
  name_regex = "^CentOS Linux 7"
  most_recent = true
}
