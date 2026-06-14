# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_identity_group_membership              │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_identity_group_membership" "this" {

  group       = ""     # string | required | The name of the Group to create this membership in.
  id          = ""     # string | optional+computed

  # create_time = ""     # string | computed | The time when the Membership was created.
  # name        = ""     # string | computed | The resource name of the Membership, of the form groups/{gro…
  # type        = ""     # string | computed | The type of the membership.
  # update_time = ""     # string | computed | The time when the Membership was last updated.

  preferred_member_key { # list [0..1]
    id        = ""     # string | required | The ID of the entity.  For Google-managed entities, the id m…
    namespace = ""     # string | optional | The namespace in which the entity exists.  If not specified,…

  }

  roles { # set [1..*]
    name = ""     # string | required | The name of the MembershipRole. Must be one of OWNER, MANAGE…

    expiry_detail { # list [0..1]
      expire_time = ""     # string | required | The time at which the MembershipRole will expire.  A timesta…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

