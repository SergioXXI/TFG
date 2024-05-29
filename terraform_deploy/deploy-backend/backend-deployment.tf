provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "backend" {
  metadata {
    name = "backend-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "backend"
      }
    }
    template {
      metadata {
        labels = {
          app = "backend"
        }
      }
      spec {
        container {
          name  = "backend"
          image = "sergiobarpor/backend:k"
          port {
            container_port = 4000
          }
          env {
            name  = "MYSQL_HOST"
            value = "mysql-service"
          }
          env {
            name  = "MYSQL_USER"
            value = "root"
          }
          env {
            name  = "MYSQL_PASSWORD"
            value = "root_password"
          }
          env {
            name  = "MYSQL_DATABASE"
            value = "prueba"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "backend" {
  metadata {
    name = "backend-service"
  }
  spec {
    selector = {
      app = "backend"
    }
    port {
      protocol    = "TCP"
      port        = 4000
      target_port = 4000
    }
    type = "LoadBalancer"  
  }
}
