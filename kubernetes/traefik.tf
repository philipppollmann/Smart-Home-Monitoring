#resource "helm_release" "traefik" {
#  name       = "traefik"
#  chart      = "traefik"
#  repository = "https://traefik.github.io/charts"
#
#  namespace  = "traefik"
#  create_namespace = true
#  timeout    = 1200 # 20 minutes
#
#  values = [<<EOF
#  deployment:
#    replicas: 2
#
#  ports:
#    web:
#      expose: 
#        enabled: true
#        port: 80
#    websecure:
#      expose:
#        enabled: true
#        port: 443
#
#  ingressRoute:
#    dashboard:
#      enabled: true
#
#  additionalArguments:
#    - "--log.level=INFO"
#    - "--providers.kubernetesIngress=true"
#  EOF
#  ]
#
#  provisioner "local-exec" {
#    command = "helm repo update"
#  }
# }