# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_sql_user                                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_sql_user" "this" {

  instance                = ""     # string | required | The name of the Cloud SQL instance. Changing this forces a n…
  name                    = ""     # string | required | The name of the user. Changing this forces a new resource to…
  deletion_policy         = ""     # string | optional | The deletion policy for the user. Setting ABANDON allows the…
  host                    = ""     # string | optional+computed | The host the user can connect from. This is only supported f…
  id                      = ""     # string | optional+computed
  password                = ""     # string | optional+sensitive | The password for the user. Can be updated. For Postgres inst…
  project                 = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  type                    = ""     # string | optional | The user type. It determines the method to authenticate the …

  # sql_server_user_details = [  # list(object)
  #   {
  #     disabled = false
  #     server_roles = []  # list(string)
  #   }
  # ]

  password_policy { # list [0..1]
    allowed_failed_attempts      = 0      # number | optional | Number of failed attempts allowed before the user get locked…
    enable_failed_attempts_check = false  # bool | optional | If true, the check that will lock user after too many failed…
    enable_password_verification = false  # bool | optional | If true, the user must specify the current password before c…
    password_expiration_duration = ""     # string | optional | Password expiration duration with one week grace period.

    # status = [  # list(object)
    #   {
    #     locked = false
    #     password_expiration_time = ""
    #   }
    # ]

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

