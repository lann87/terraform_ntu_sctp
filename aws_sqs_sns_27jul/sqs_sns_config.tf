resource "aws_sqs_queue" "c7_alanp_tf_sqscon_27jul" {
  name                      = "c7_alan_tf_queue"
  delay_seconds             = 10
  max_message_size          = 2048
  message_retention_seconds = 10000
  receive_wait_time_seconds = 10
}

resource "aws_sns_topic" "c7_alanp_sns_27jul" {
  name = "c7_alanp_sns"
}

# sqs subscription
resource "aws_sns_topic_subscription" "c7_alanp_sqs_sub" {
  topic_arn = aws_sns_topic.c7_alanp_sns_27jul.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.c7_alanp_tf_sqscon_27jul.arn
}

# email subscription
resource "aws_sns_topic_subscription" "c7_alanp_sns_email_sub" {
  topic_arn = aws_sns_topic.c7_alanp_sns_27jul.arn
  protocol  = "email"
  endpoint  = "alanpeh87@gmail.com"
}