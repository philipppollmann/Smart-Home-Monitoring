# resource "null_resource" "add_traefik_helm_repo" {
#   provisioner "local-exec" {
#     command = "helm repo add traefik https://traefik.github.io/charts && helm repo update"
#   }
# }

# resource "helm_release" "traefik_mesh_crds" {
#   name       = "traefik-mesh-crds"
#   repository = "https://traefik.github.io/charts"
#   chart      = "traefik-mesh"
#   version    = "3.0.4"

#   namespace = "traefik-mesh"
#   create_namespace = true
#   values = []

#   # Installiere die CRDs zuerst
#   skip_crds = false
# }

# resource "helm_release" "traefik_mesh" {
# #  depends_on = [null_resource.add_traefik_helm_repo]
#   depends_on = [helm_release.traefik_mesh_crds]

#   name       = "my-traefik-mesh"
#   repository = "https://traefik.github.io/charts"
#   chart      = "traefik-mesh"
#   version    = "3.0.4"

#   namespace         = "traefik-mesh"

#   timeout = 2400 # 40 minutes

#   values = [
#     <<EOF
# controller:
#   service:
#     type: LoadBalancer
# EOF
#   ]
# }