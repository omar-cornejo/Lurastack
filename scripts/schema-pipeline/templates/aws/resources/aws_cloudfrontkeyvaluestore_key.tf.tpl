# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfrontkeyvaluestore_key                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfrontkeyvaluestore_key" "this" {

  key                 = ""     # string | required | The key to put.
  key_value_store_arn = ""     # string | required | The Amazon Resource Name (ARN) of the Key Value Store.
  value               = ""     # string | required | The value to put.

  # id                  = ""     # string | computed
  # total_size_in_bytes = 0      # number | computed | Total size of the Key Value Store in bytes.

}

