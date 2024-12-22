/*resource "helm_release" "supabase" {
  name       = "supabase"
  chart      = "supabase"
  repository = "https://charts.bitnami.com/bitnami"
  namespace  = "supabase"

  values = [
    <<EOF
global:
  postgresql:
    auth:
      postgresPassword: "supabase-password"
  service:
    port: 80
EOF
  ]
}


resource "kubernetes_manifest" "supabase_middleware" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "Middleware"
    metadata = {
      name      = "supabase-stripprefix"
      namespace = "supabase"
    }
    spec = {
      stripPrefix = {
        prefixes = ["/supabase"]
      }
    }
  }
}


resource "kubernetes_manifest" "supabase_ingressroute" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "supabase"
      namespace = "supabase"
    }
    spec = {
      entryPoints = ["web"]
      routes = [{
        match      = "PathPrefix(`/supabase`)"
        kind       = "Rule"
        services = [{
          name = "supabase"
          port = 80
        }]
        middlewares = [{
          name = "supabase-stripprefix"
        }]
      }]
    }
  }
}*/