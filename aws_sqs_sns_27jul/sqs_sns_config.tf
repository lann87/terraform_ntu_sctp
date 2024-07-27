resource "aws_sqs_queue" "c7_alanp_tf_sqscon_27jul" {
  name                      = "c7_alan_tf_queue"
  delay_seconds             = 10
  max_message_size          = 2048
  message_retention_seconds = 10000
  receive_wait_time_seconds = 10
}

resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.user_updates_queue.arn
}