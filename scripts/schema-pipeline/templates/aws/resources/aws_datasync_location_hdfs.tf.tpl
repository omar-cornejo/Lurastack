# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_hdfs                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_hdfs" "this" {

  agent_arns                = []     # set(string) | required
  authentication_type       = ""     # string | optional
  block_size                = 0      # number | optional
  id                        = ""     # string | optional+computed
  kerberos_keytab           = ""     # string | optional
  kerberos_keytab_base64    = ""     # string | optional
  kerberos_krb5_conf        = ""     # string | optional
  kerberos_krb5_conf_base64 = ""     # string | optional
  kerberos_principal        = ""     # string | optional
  kms_key_provider_uri      = ""     # string | optional
  replication_factor        = 0      # number | optional
  simple_user               = ""     # string | optional
  subdirectory              = ""     # string | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # uri                       = ""     # string | computed

  name_node { # set [1..*]
    hostname = ""     # string | required
    port     = 0      # number | required

  }

  qop_configuration { # list [0..1]
    data_transfer_protection = ""     # string | optional+computed
    rpc_protection           = ""     # string | optional+computed

  }

}

