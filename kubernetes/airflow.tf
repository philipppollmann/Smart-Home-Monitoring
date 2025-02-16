resource "null_resource" "add_airflow_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add apache-airflow https://airflow.apache.org/ && helm repo update"
  }
}

# resource "helm_release" "airflow" {
#   depends_on = [null_resource.add_airflow_helm_repo]

#   name       = "airflow"
#   repository = "https://airflow.apache.org/"
#   chart      = "airflow"
#   version    = "1.15.0"

#   namespace         = "airflow"
#   create_namespace  = true

#   timeout = 2400 # 40 minutes

#   values = [
#     <<EOF
# # Add custom values
# EOF
#   ]
# }