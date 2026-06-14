# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sourcerepo_repository                            │
# └──────────────────────────────────────────────────────────────┘
data "google_sourcerepo_repository" "this" {

  name           = ""     # string | required | Resource name of the repository, of the form '{{repo}}'. The…
  id             = ""     # string | optional+computed
  project        = ""     # string | optional

  # pubsub_configs = [  # set(object)
  #   {
  #     message_format = ""
  #     service_account_email = ""
  #     topic = ""
  #   }
  # ]
  # size           = 0      # number | computed | The disk usage of the repo, in bytes.
  # url            = ""     # string | computed | URL to clone the repository from Google Cloud Source Reposit…

}

