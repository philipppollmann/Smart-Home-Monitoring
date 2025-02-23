resource "null_resource" "add_influxdata_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add influxdata https://helm.influxdata.com/ && helm repo update"
  }
}

# resource "helm_release" "influxdb" {
#   depends_on = [null_resource.add_influxdata_helm_repo]

#   name       = "influxdb"
#   repository = "https://helm.influxdata.com/"
#   chart      = "influxdb"
#   version    = "4.12.5"

#   namespace         = "influxdb"
#   create_namespace  = true

#   timeout = 2400 # 40 minutes

#   values = [
#     <<EOF
# # Beispiel-Konfiguration - kann angepasst werden
# service:
#   type: LoadBalancer
# EOF
#   ]
# }