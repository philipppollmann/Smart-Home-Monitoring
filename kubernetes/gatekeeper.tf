resource "null_resource" "add_gatekeeper_repo" {
  provisioner "local-exec" {
    command = "helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts && helm repo update"
  }
}

resource "helm_release" "gatekeeper" {
  depends_on = [null_resource.add_gatekeeper_repo]

  name       = "gatekeeper"
  chart      = "gatekeeper"
  repository = "https://open-policy-agent.github.io/gatekeeper/charts"
  version    = "3.13.0"  # Use the latest stable version

  namespace         = "gatekeeper"
  create_namespace  = true
}