resource "helm_release" "example" {
  name       = var.name
  namespace = var.namespace
  chart      = var.chart # Path to the local helm chart
}

