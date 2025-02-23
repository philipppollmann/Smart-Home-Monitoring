resource "null_resource" "add_jaeger_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add jaegertracing https://jaegertracing.github.io/helm-charts && helm repo update"
  }
}


# resource "helm_release" "jaeger" {
#   depends_on = [null_resource.add_jaeger_helm_repo]

#   name       = "jaeger"
#   repository = "https://jaegertracing.github.io/helm-charts"
#   chart      = "jaeger"
#   version    = "3.4.0"

#   namespace         = "jaeger"
#   create_namespace  = true

#   timeout = 2400 # 40 Minuten

#   values = [
#     <<EOF
# collector:
#   service:
#     type: LoadBalancer
# query:
#   service:
#     type: LoadBalancer
# EOF
#   ]
# }