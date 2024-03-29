resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = {
      name = ""
    }

    labels = {

    }

    name = ""
  }
}