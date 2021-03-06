provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "practice" {
  ami = data.aws_ami.ami.image_id
  instance_type = "t2.micro"
  key_name = "practice"
  security_groups = [data.aws_security_group.sg.name,data.aws_security_group.sg1.name]
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
      "sudo yum install epel-release -y",
      "sudo yum install unzip -y",
      "sudo yum install ansible -y",
      "sudo yum install git -y",
      "echo localhost>/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://github.com/naveenthangella/Practice.git Ansible/playbooks/main.yml"

    ]
  }
}

//resource "aws_s3_bucket" "html" {
//  bucket = "sample-html-naveen"
//  acl = "private"
//  tags = {
//    Name = "my bucket"
//  }
//  }
//resource "aws_s3_bucket_object" "Object" {
//  bucket = "sample-html-naveen"
//  key = "sample-html"
//  source = ""
//}

data "aws_security_group" "sg" {
  filter {
    name = "description"
    values = ["This security group was generated by AWS Marketplace and is based on recommended settings for CentOS 7 (x86_64) - with Updates HVM version 2002_01 provided by Centos.org"]
  }
}
data "aws_security_group" "sg1" {
  filter {
    name = "description"
    values = ["allow web"]
  }
}
data "aws_ami" "ami" {
  owners = ["679593333241"]
  name_regex = "^CentOS Linux 7"
  most_recent = true
}
