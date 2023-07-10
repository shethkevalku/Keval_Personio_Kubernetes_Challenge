resource "kubernetes_deployment" "app1" {
  metadata {
    name = "test-sample-website"
    labels = {
      App = "test-sample-website"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "test-sample-website"
      }
    }
    template {
      metadata {
        labels = {
          App = "test-sample-website"
        }
      }
      spec {
        container {
          image = "328296826261.dkr.ecr.eu-west-1.amazonaws.com/personio-ecr:development"
          name  = "test-sample-website"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

# resource "kubectl_manifest" "app1" {
#   metadata {
#     name = "newnewsample-website"
#     labels = {
#       App = "newnewsample-website"
#     }
#   }

#   spec {
#     replicas = 2
#     selector {
#       match_labels = {
#         App = "newnewsample-website"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           App = "newnewnewsample-website"
#         }
#       }
#       spec {
#         container {
#           image = "328296826261.dkr.ecr.eu-west-1.amazonaws.com/personio-ecr:development"
#           name  = "newnewnewsample-website"

#           port {
#             container_port = 80
#           }

#           resources {
#             limits = {
#               cpu    = "0.5"
#               memory = "512Mi"
#             }
#             requests = {
#               cpu    = "250m"
#               memory = "50Mi"
#             }
#           }
#         }
#       }
#     }
#   }
# }
