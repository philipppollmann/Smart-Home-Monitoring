resource "null_resource" "helm_kubernetes_dashboard_repo_add" {
  provisioner "local-exec" {
    command = "helm repo add k8s-dashboard https://kubernetes.github.io/dashboard && helm repo update"
  }
}

resource "helm_release" "kubernetes_dashboard" {
  depends_on = [null_resource.helm_kubernetes_dashboard_repo_add]

  name       = "kubernetes-dashboard"
  chart      = "kubernetes-dashboard"
  repository = "https://kubernetes.github.io/dashboard"
  version    = "7.10.4"

  namespace  = "kubernetes-dashboard"
  create_namespace = true

  values = [<<EOF
EOF
  ]
}

resource "kubernetes_manifest" "traefik_ingress_kubernetes_dashboard" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "kubernetes-dashboard"
      namespace = "kubernetes-dashboard"
    }
    spec = {
      entryPoints = ["web"]
      routes = [
        {
          match = "Host(`localhost`) && PathPrefix(`/kubernetes`)"
          kind  = "Rule"
          services = [
            {
              name = "kubernetes-dashboard-web"
              port = 8000
            }
          ]
        }
      ]
    }
  }
}