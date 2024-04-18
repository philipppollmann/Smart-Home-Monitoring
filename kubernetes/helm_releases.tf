# Traefik Helm Chart
resource "null_resource" "traefik_helm_dependencies" {

  provisioner "local-exec" {
    command = <<EOT
      cd ../charts/KubeDashboard
      helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
      helm dependency build
      cd ../../../
    EOT
  }
}

resource "helm_release" "kubernetes_dashboard_release" {
  chart = "../charts/KubeDashboard"
  name  = "kubernetes-dashboard"
  namespace = "default"
}