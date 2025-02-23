resource "null_resource" "add_keycloak_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add bitnami https://charts.bitnami.com/bitnami && helm repo update"
  }
  
}

# resource "helm_release" "keycloak" {
#   name       = "keycloak"
#   chart      = "keycloak"
#   repository = "https://charts.bitnami.com/bitnami"

#   namespace = "keycloak"
#   create_namespace = true


#   values = [
#     <<EOF
#     replicaCount: 2
#     resources:
#       requests:
#         memory: "512Mi"
#         cpu: "500m"
#     EOF
#   ]


#   timeout     = 600
#   force_update = true
# }