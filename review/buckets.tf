variable "bucket_reader_arn" {
  description = "ARN of the bucket-reader IAM role"
  type = string
}

resource "aws_s3_bucket" "backup" {
  bucket = "recrd-backup"
}

resource "aws_s3_bucket_policy" "backup_policy" {
  bucket = aws_s3_bucket.backup.id
  policy = data.aws_iam_policy_document.bucket_reader.json
}

resource "aws_s3_bucket" "media" {
  bucket = "recrd-media"
}

resource "aws_s3_bucket_policy" "media_policy" {
  bucket = aws_s3_bucket.media.id
  policy = data.aws_iam_policy_document.bucket_reader.json
}

resource "aws_s3_bucket" "static" {
  bucket = "recrd-static"
}

resource "aws_s3_bucket_policy" "static-policy" {
  bucket = aws_s3_bucket.static.id
  policy = data.aws_iam_policy_document.bucket_reader.json
}

data "aws_iam_policy_document" "bucket_reader" {
  statement {
    principals {
      type = "AWS"
      identifiers = ["${var.bucket_reader_arn}"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::recrd-backup",
      "arn:aws:s3:::recrd-backup/*",
      "arn:aws:s3:::recrd-media",
      "arn:aws:s3:::recrd-media/*",
      "arn:aws:s3:::recrd-static",
      "arn:aws:s3:::recrd-static/*",
    ]
  }
}
