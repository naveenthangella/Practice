resource "aws_s3_bucket" "html" {
  bucket = "sample-html-naveen"
  acl = "public"
  tags = {
    Name = "my bucket"
  }
}