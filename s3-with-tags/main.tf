resource "aws_s3_bucket" "name" {
  bucket = "chinnipandu"
  tags = {
    Name = "rams"
  }
}