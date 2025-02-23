resource "null_resource" "vault_helm_repo_add" {
  provisioner "local-exec" {
    command = "helm repo add hashicorp https://helm.releases.hashicorp.com && helm repo update"
  }
}

resource "helm_release" "vault" {
  depends_on = [null_resource.vault_helm_repo_add]

  name       = "vault"
  chart      = "vault"
  repository = "https://helm.releases.hashicorp.com"
  version    = "0.29.1"

  namespace  = "vault"
  create_namespace = true

  values = [<<EOF
# Hier können Sie zusätzliche Werte für das Helm-Chart hinzufügen
EOF
  ]
}

resource "kubernetes_manifest" "traefik_ingress_vault" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "vault"
      namespace = "vault"
    }
    spec = {
      entryPoints = ["web"]
      routes = [
        {
          match = "Host(`localhost`) && PathPrefix(`/vault`)"
          kind  = "Rule"
          services = [
            {
              name = "vault"
              port = 8200
            }
          ]
        }
      ]
    }
  }
}