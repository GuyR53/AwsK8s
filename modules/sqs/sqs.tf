resource "aws_sqs_queue" "terraform_queue" {
  name                      = "${var.env}-sqs"
  delay_seconds             = 0
  max_message_size          = 2048
  message_retention_seconds = 86400


  tags = {
    Name = "${var.env}-sqs"
  }
}