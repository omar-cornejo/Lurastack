# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_ciphertext                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_ciphertext" "this" {

  key_id          = ""     # string | required
  plaintext       = ""     # string | required+sensitive
  context         = {}     # map(string) | optional
  id              = ""     # string | optional+computed

  # ciphertext_blob = ""     # string | computed

}

