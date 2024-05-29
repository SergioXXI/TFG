provider "kubernetes" {
  config_path = "~/.kube/config"  # Ruta a tu archivo de configuración de kubeconfig
}

resource "kubernetes_deployment" "mysql" {
  metadata {
    name      = "mysql"
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          name  = "mysql"
          image = "mysql:5.7"

          args = ["--ignore-db-dir=lost+found"]

          port {
            container_port = 3306
          }

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "root_password"
          }

          env {
            name  = "MYSQL_DATABASE"
            value = "prueba"
          }

          volume_mount {
            name       = "mysql-storage"
            mount_path = "/var/lib/mysql"
          }

          volume_mount {
            name       = "initdb-config"
            mount_path = "/docker-entrypoint-initdb.d"
          }
        }

        volume {
          name = "mysql-storage"

          persistent_volume_claim {
            claim_name = "mysql-pvc"
          }
        }

        volume {
          name = "initdb-config"

          config_map {
            name = "mysql-initdb-config"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mysql_service" {
  metadata {
    name      = "mysql-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = "mysql"
    }

    port {
      protocol    = "TCP"
      port        = 3306
      target_port = 3306
    }

    type = "ClusterIP"
  }
}
