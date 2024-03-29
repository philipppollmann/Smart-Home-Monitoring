resource "kubernetes_pod" "pod" {
  metadata {
    name = ""
  }

  spec {
    container {
      image = ""
      name = ""

      env {
        name = ""
      }

      port {
        container_port = 0
      }

      liveness_probe {
        http_get {
          http_header {

          }
        }

      }
    }
  }
}