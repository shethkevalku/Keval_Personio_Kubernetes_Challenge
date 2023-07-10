# resource "kubernetes_deployment" "app1" {
#   metadata {
#     name = "test-sample-website"
#     labels = {
#       App = "test-sample-website"
#     }
#   }

#   spec {
#     replicas = 2
#     selector {
#       match_labels = {
#         App = "test-sample-website"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           App = "test-sample-website"
#         }
#       }
#       spec {
#         container {
#           image = "328296826261.dkr.ecr.us-east-2.amazonkubectl aws.com/personio-ecr:development"
#           name  = "test-sample-website"

#           port {
#             container_port = 8080
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
# resource "kubernetes_service_v1" "example" {
#   metadata {
#     name = "test-sample-website-service"
#   }
#   spec {
#     selector = {
#       app = "test-sample-website"
#     }
#     port {
#       protocol    = "TCP"
#       port        = 80
#       target_port = 8080
#     }

#     type = "LoadBalancer"
#   }
# }