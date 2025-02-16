resource "null_resource" "add_home_assistant_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add k8s-home-lab-repo https://k8s-home-lab.github.io/helm-charts/ && helm repo update"
  }
}

resource "helm_release" "home_assistant" {
  depends_on = [null_resource.add_home_assistant_helm_repo]

  name       = "home-assistant"
  repository = "https://k8s-home-lab.github.io/helm-charts/"
  chart      = "home-assistant"
  version    = "14.0.1"

  namespace         = "home-assistant"
  create_namespace  = true

  timeout = 1200 # 20 minutes

  values = [
    <<EOF
# Add custom values
EOF
  ]
}