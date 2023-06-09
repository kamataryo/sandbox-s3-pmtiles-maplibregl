resource "aws_s3_bucket" "main" {
  bucket_prefix = "sandbox-s3-pmtiles-maplibregl-"
}

resource "aws_s3_bucket_cors_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    max_age_seconds = 0
  }
}

resource "aws_s3_object" "pmtile" {
  bucket = aws_s3_bucket.main.id
  key    = "hello.pmtiles"
  source = "assets/hello.pmtiles"
  etag   = filemd5("assets/hello.pmtiles")
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.s3_main_policy.json
}

data "aws_iam_policy_document" "s3_main_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.main.iam_arn]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.main.arn}/*"]
  }
}
