resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  inline_policy {
    name = "bucket_access"

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": ["*"],
      "Sid": ""
    }
  ]
}
EOF
  }
}

resource "aws_lambda_function" "media_manager" {
  filename = "media_manager.zip"
  function_name = "media-manager"
  role = aws_iam_role.iam_for_lambda.arn

  source_code_hash = filebase64sha256("media_manager.zip")

  runtime = "nodejs12.x"
  handler = "index.handler"

  environment {
    variables = {
      BUCKET = "recrd-media"
      USERNAME = "recrd"
      PASSWORD = "pib6ro7eewo8wah2Oopiexei_g1ohnu2"
    }
  }
}
