# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfrontkeyvaluestore_keys_exclusive          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfrontkeyvaluestore_keys_exclusive" "this" {

  key_value_store_arn = ""     # string | required | The Amazon Resource Name (ARN) of the Key Value Store.
  max_batch_size      = 0      # number | optional+computed | Maximum resource key values pairs that you wills update in a…

  # total_size_in_bytes = 0      # number | computed | Total size of the Key Value Store in bytes.

  resource_key_value_pair { # set
    key   = ""     # string | required | The key to put.
    value = ""     # string | required | The value to put.

  }

}

