resource "helm_release" "example" {
  name       = var.name
  repository = var.repository
  chart      = var.chart
  version    = var.version

  values = [
    "${file(var.values_file)}"
  ]

}