resource "helm_release" "traefik" {
  name       = "traefik"
  chart      = "traefik"
  repository = "https://traefik.github.io/charts"

  namespace  = "traefik"
  create_namespace = true
  timeout    = 1200 # 20 minutes

  values = [<<EOF
deployment:
  replicas: 2

ports:
  web:
    expose: 
      enabled: true
      port: 80
  websecure:
    expose:
      enabled: true
      port: 443

ingressRoute:
  dashboard:
    enabled: true

additionalArguments:
  - "--log.level=INFO"
  - "--providers.kubernetesIngress=true"
EOF
  ]

  provisioner "local-exec" {
    command = "helm repo update"
  }
}

resource "kubernetes_manifest" "traefik_dashboard" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "dashboard"
      namespace = "traefik"
    }
    spec = {
      entryPoints = ["web"]
      routes = [
        {
          match = "Host(`localhost`) && PathPrefix(`/traefik`)"
          kind  = "Rule"
          services = [
            {
              name = "api@internal"
              port = 80
            }
          ]
        }
      ]
    }
  }
}