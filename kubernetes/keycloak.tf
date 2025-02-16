# resource "helm_release" "keycloak" {
#   name       = "keycloak"
#   chart      = "bitnami/keycloak"
#   repository = "https://charts.bitnami.com/bitnami"
#   version    = "24.4.9"

#   namespace         = "keycloak"
#   create_namespace  = true
#   timeout           = 1200 # 20 minutes
# }