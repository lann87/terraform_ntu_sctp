resource "aws_sqs_queue" "terraform_queue" {
  name                      = "alan_tf_queue"
  delay_seconds             = 10    
  max_message_size          = 2048
  message_retention_seconds = 10000
  receive_wait_time_seconds = 10
}