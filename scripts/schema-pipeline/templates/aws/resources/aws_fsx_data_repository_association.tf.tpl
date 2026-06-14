# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_data_repository_association                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_data_repository_association" "this" {

  data_repository_path             = ""     # string | required
  file_system_id                   = ""     # string | required
  file_system_path                 = ""     # string | required
  batch_import_meta_data_on_create = false  # bool | optional
  delete_data_in_filesystem        = false  # bool | optional
  id                               = ""     # string | optional+computed
  imported_file_chunk_size         = 0      # number | optional+computed
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # association_id                   = ""     # string | computed

  s3 { # list [0..1]

    auto_export_policy { # list [0..1]
      events = []     # list(string) | optional+computed

    }

    auto_import_policy { # list [0..1]
      events = []     # list(string) | optional+computed

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

