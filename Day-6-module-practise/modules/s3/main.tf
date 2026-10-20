
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "storage-class-transition"
    status = "Enabled"

    filter {}

    # Standard to Standard-IA after 30 days
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    # Standard-IA to Glacier after 60 days
    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    # Glacier to Deep Archive after 180 days
    transition {
      days          = 180
      storage_class = "DEEP_ARCHIVE"
    }
  }
}

