# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rekognition_stream_processor                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rekognition_stream_processor" "this" {

  name                 = ""     # string | required | An identifier you assign to the stream processor.
  role_arn             = ""     # string | required | The Amazon Resource Number (ARN) of the IAM role that allows…
  kms_key_id           = ""     # string | optional | The identifier for your AWS Key Management Service key (AWS …
  tags                 = {}     # map(string) | optional

  # arn                  = ""     # string | computed
  # stream_processor_arn = ""     # string | computed+DEPRECATED
  # tags_all             = {}     # map(string) | computed

  data_sharing_preference { # list
    opt_in = false  # bool | required | Do you want to share data with Rekognition to improve model …

  }

  input { # list

    kinesis_video_stream { # list
      arn = ""     # string | required | ARN of the Kinesis video stream stream that streams the sour…

    }

  }

  notification_channel { # list
    sns_topic_arn = ""     # string | optional | The Amazon Resource Number (ARN) of the Amazon Amazon Simple…

  }

  output { # list

    kinesis_data_stream { # list
      arn = ""     # string | optional | ARN of the output Amazon Kinesis Data Streams stream.

    }

    s3_destination { # list
      bucket     = ""     # string | optional | The name of the Amazon S3 bucket you want to associate with …
      key_prefix = ""     # string | optional | The prefix value of the location within the bucket that you …

    }

  }

  regions_of_interest { # list

    bounding_box { # single
      height = 0      # number | optional | Height of the bounding box as a ratio of the overall image h…
      left   = 0      # number | optional | Left coordinate of the bounding box as a ratio of overall im…
      top    = 0      # number | optional | Top coordinate of the bounding box as a ratio of overall ima…
      width  = 0      # number | optional | Width of the bounding box as a ratio of the overall image wi…

    }

    polygon { # list
      x = 0      # number | optional | The value of the X coordinate for a point on a Polygon.
      y = 0      # number | optional | The value of the Y coordinate for a point on a Polygon.

    }

  }

  settings { # list

    connected_home { # list
      labels         = []     # list(string) | optional | Specifies what you want to detect in the video, such as peop…
      min_confidence = 0      # number | optional+computed | The minimum confidence required to label an object in the vi…

    }

    face_search { # list
      collection_id        = ""     # string | required | The ID of a collection that contains faces that you want to …
      face_match_threshold = 0      # number | optional+computed | Minimum face match confidence score that must be met to retu…

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

