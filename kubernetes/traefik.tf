resource "helm_release" "traefik" {
  name       = "traefik"
  chart      = "traefik"
  repository = "https://traefik.github.io/charts"
  namespace  = "traefik"
  timeout    = 1200

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
}

resource "kubernetes_manifest" "traefik_dashboard" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "dashboard"
      namespace = "traefik"  # Namespace bleibt unverändert
    }
    spec = {
      entryPoints = ["web"]
      routes = [
        {
          match = "Host(`localhost`) && PathPrefix(`/traefik`)"  # Anpassung des Hostnamens und des Pfads
          kind  = "Rule"
          services = [
            {
              name = "api@internal"
              kind = "TraefikService"
            }
          ]
        }
      ]
    }
  }
}