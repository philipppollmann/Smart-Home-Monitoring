resource "null_resource" "add_elastic_repo" {
  provisioner "local-exec" {
    command = "helm repo add elastic https://helm.elastic.co && helm repo update"
  }
}

# resource "helm_release" "elasticsearch" {
#   depends_on = [null_resource.add_elastic_repo]

#   name       = "elasticsearch"
#   chart      = "elasticsearch"
#   repository = "https://helm.elastic.co"
#   version    = "8.5.1"

#   namespace       = "monitoring" 
#   create_namespace = true  

#   values = [
#     <<EOF
#     replicas: 3
#     resources:
#       requests:
#         memory: "1Gi"
#         cpu: "1"
#     EOF
#   ]

#   timeout      = 600
#   force_update = true
# }


# resource "helm_release" "kibana" {
#   depends_on = [null_resource.add_elastic_repo]

#   name       = "kibana"
#   chart      = "kibana"
#   repository = "https://helm.elastic.co"
#   version    = "8.5.1"

#   namespace       = "monitoring"     
#   create_namespace = true    

#   values = [
#     <<EOF
#     replicas: 2
#     resources:
#       requests:
#         memory: "512Mi"
#         cpu: "500m"
#     EOF
#   ]

#   timeout      = 600
#   force_update = true
# }
