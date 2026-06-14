# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_opensearchserverless_security_config                │
# └──────────────────────────────────────────────────────────────┘
data "aws_opensearchserverless_security_config" "this" {

  id                 = ""     # string | required | The unique identifier of the security configuration.

  # config_version     = ""     # string | computed | The version of the security configuration.
  # created_date       = ""     # string | computed | The date the configuration was created.
  # description        = ""     # string | computed | The description of the security configuration.
  # last_modified_date = ""     # string | computed | The date the configuration was last modified.
  # type               = ""     # string | computed | The type of security configuration.

  saml_options { # single

    # group_attribute = ""     # string | computed | Group attribute for this SAML integration.
    # metadata        = ""     # string | computed | The XML IdP metadata file generated from your identity provi…
    # session_timeout = 0      # number | computed | Session timeout, in minutes. Minimum is 5 minutes and maximu…
    # user_attribute  = ""     # string | computed | User attribute for this SAML integration.

  }

}

