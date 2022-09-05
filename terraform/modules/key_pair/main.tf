resource "aws_key_pair" "test-pem" {
  key_name = "test-pem-${var.environment}"
  public_key = file("./files/test-${var.environment}.pub")
}
