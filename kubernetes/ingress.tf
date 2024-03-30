# LaunchPad

# Traefik Dashboard
resource "kubernetes_manifest" "dashboard_ingressroute" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name = "traefik-dashboard"
      namespace = "kube-system"
    }
    spec = {
      entryPoints = [
        "web"
      ]
      routes = [
        {
          match = "Host(`${var.host_name}`)"
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

# Grafana

# Prometheus

# HomeBridge

#HomeAssistant