provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "practice" {
  ami = data.aws_ami.ami.image_id
  instance_type = "t2.micro"
  tags = {
    Name  = "practice"
  }
}

data "aws_ami" "ami" {
  owners = ["679593333241"]
  name_regex = "^CentOS Linux 7"
  most_recent = true
}