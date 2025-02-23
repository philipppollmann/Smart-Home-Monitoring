resource "null_resource" "add_prometheus_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && helm repo update"
  }
}

# resource "helm_release" "prometheus_stack" {
#   depends_on = [null_resource.add_prometheus_helm_repo]

#   name       = "my-prometheus-stack"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "kube-prometheus-stack"
#   version    = "48.3.1" 

#   namespace         = "monitoring"
#   create_namespace  = true

#   timeout           = 2400 # 40 minutes

#   values = [
#     <<EOF
# # Beispiel-Konfiguration für Prometheus, je nach Bedarf anpassen
# grafana:
#   enabled: true
#   service:
#     type: LoadBalancer
# EOF
#   ]
# }