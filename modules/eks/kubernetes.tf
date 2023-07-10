resource "kubernetes_deployment" "app1" {
  metadata {
    name = "sample-website"
    labels = {
      App = "sample-website"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "sample-website"
      }
    }
    template {
      metadata {
        labels = {
          App = "sample-website"
        }
      }
      spec {
        container {
          image = "328296826261.dkr.ecr.us-east-2.amazonaws.com/personio-ecr:development"
          name  = "sample-website"

          port {
            container_port = 8080
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
resource "kubernetes_service_v1" "example" {
  metadata {
    name = "sample-website-service"
  }
  spec {
    selector = {
      app = "sample-website"
    }
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}