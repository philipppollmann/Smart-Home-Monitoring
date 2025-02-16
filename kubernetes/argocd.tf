# resource "null_resource" "add_argocd_helm_repo" {
#   provisioner "local-exec" {
#     command = "helm repo add argo https://argoproj.github.io/argo-helm && helm repo update"
#   }
# }

# resource "helm_release" "argocd" {
#   name       = "arco-cd"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   version    = "7.8.2"
  
#   namespace         = "argocd"
#   create_namespace  = true

#   timeout = 1200 # 20 minutes


#   values = [
#     <<EOF
# server:
#   service:
#     type: LoadBalancer
# EOF
#   ]
# }