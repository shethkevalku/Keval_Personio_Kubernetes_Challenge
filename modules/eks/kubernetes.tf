resource "kubernetes_deployment" "app1" {
  metadata {
    name = "hello-website"
    labels = {
      App = "hello-website"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "hello-website"
      }
    }
    template {
      metadata {
        labels = {
          App = "hello-website"
        }
      }
      spec {
        container {
          image = "328296826261.dkr.ecr.us-east-2.amazonaws.com/personio-ecr:development"
          name  = "hello-website"

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
    name = "hello-website-service"
  }
  spec {
    selector = {
      app = "hello-website"
    }
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}