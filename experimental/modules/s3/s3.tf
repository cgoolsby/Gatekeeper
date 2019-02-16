
resource "aws_s3_bucket" "iotdatas3" {
  bucket = "iotdatas3"

  tags = {
    name = "iot3 bucket"
    environment = "kafka-spark-postgres"
  }
}
