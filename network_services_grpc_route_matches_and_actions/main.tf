resource "google_network_services_grpc_route" "default" {
  provider               = google-beta
  name                   = "my-grpc-route-${local.name_suffix}"
  labels                 = {
    foo = "bar"
  }
  description             = "my description"
  hostnames               = ["example"]
  rules                   {
    matches {
      headers {
        key = "key"
        value = "value"
      }
    }
    matches {
      headers {
        key = "key"
        value = "value"
      }
      method {
        grpc_service = "foo"
        grpc_method = "bar"
        case_sensitive = true
      }
    }
    action {
      fault_injection_policy {
       delay {
         fixed_delay = "1s"
         percentage = 1
       }
       abort {
         http_status = 500
         percentage = 1
       }
     }
      retry_policy {
          retry_conditions = ["cancelled"]
          num_retries = 1
      }
    }
  }
}
