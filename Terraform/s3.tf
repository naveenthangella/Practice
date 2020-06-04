resource "aws_s3_bucket" "html" {
  bucket = "sample-html-naveen"
  acl = "private"
  tags = {
    Name = "my bucket"
  }
}