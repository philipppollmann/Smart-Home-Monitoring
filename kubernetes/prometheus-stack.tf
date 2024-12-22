resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  chart      = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  namespace  = "prometheus-stack"
  version    = "51.2.0" # Version prüfen, ggf. aktualisieren

  values = [
    <<EOF
grafana:
  enabled: true
  adminPassword: "admin123" # Setze ein sicheres Passwort
  service:
    type: ClusterIP
    port: 80

prometheus:
  prometheusSpec:
    serviceMonitorSelectorNilUsesHelmValues: false
    retention: "7d"
    resources:
      requests:
        memory: "1Gi"
        cpu: "500m"
      limits:
        memory: "2Gi"
        cpu: "1"
  service:
    type: ClusterIP
    port: 9090

alertmanager:
  alertmanagerSpec:
    replicas: 2
    resources:
      requests:
        memory: "512Mi"
        cpu: "250m"
      limits:
        memory: "1Gi"
        cpu: "500m"
  service:
    type: ClusterIP

EOF
  ]
}

resource "kubernetes_manifest" "prometheus_ingressroute" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "prometheus-ingress"
      namespace = "prometheus-stack"
    }
    spec = {
      entryPoints = ["web"]
      routes = [
        {
          match = "PathPrefix(`/prometheus`)"
          kind  = "Rule"
          services = [
            {
              name = "kube-prometheus-stack-prometheus"
              port = 9090
            }
          ]
        }
      ]
    }
  }
}

resource "kubernetes_manifest" "grafana_ingressroute" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "grafana-ingress"
      namespace = "prometheus-stack"
    }
    spec = {
      entryPoints = ["web"]
      routes = [
        {
          match = "PathPrefix(`/grafana`)"
          kind  = "Rule"
          services = [
            {
              name = "kube-prometheus-stack-grafana"
              port = 80
            }
          ]
        }
      ]
    }
  }
}


resource "kubernetes_manifest" "alertmanager_ingressroute" {
  manifest = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "alertmanager-ingress"
      namespace = "prometheus-stack"
    }
    spec = {
      entryPoints = ["web"]
      routes = [
        {
          match = "PathPrefix(`/alertmanager`)"
          kind  = "Rule"
          services = [
            {
              name = "kube-prometheus-stack-alertmanager"
              port = 9093
            }
          ]
        }
      ]
    }
  }
}
