# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_membership_binding                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_membership_binding" "this" {

  location              = ""     # string | required | Location of the membership
  membership_binding_id = ""     # string | required | The client-provided identifier of the membership binding.
  membership_id         = ""     # string | required | Id of the membership
  scope                 = ""     # string | required | A Workspace resource name in the format 'projects/*/location…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Labels for this Membership binding.   **Note**: This field i…
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | Time the MembershipBinding was created in UTC.
  # delete_time           = ""     # string | computed | Time the MembershipBinding was deleted in UTC.
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                  = ""     # string | computed | The resource name for the membershipbinding itself
  # state = [  # list(object)
  #   {
  #     code = ""
  #   }
  # ]
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                   = ""     # string | computed | Google-generated UUID for this resource.
  # update_time           = ""     # string | computed | Time the MembershipBinding was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

