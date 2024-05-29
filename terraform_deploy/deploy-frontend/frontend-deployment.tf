provider "kubernetes" {
  config_path = "~/.kube/config"  # Ruta a tu archivo de configuración de kubeconfig
}
resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "frontend"
      }
    }
    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }
      spec {
        container {
          name  = "frontend"
          image = "sergiobarpor/frontend:k"
          port {
            container_port = 3000
          }
          env {
            name  = "REACT_APP_BACKEND_URL"
            value = "http://backend-service:4000"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend-service"
  }
  spec {
    selector = {
      app = "frontend"
    }
    port {
      protocol    = "TCP"
      port        = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}
