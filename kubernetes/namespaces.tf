resource "kubernetes_namespace" "microservice_namespaces" {
    for_each = toset(var.microservices)
    metadata {
        name = each.key
    }
}