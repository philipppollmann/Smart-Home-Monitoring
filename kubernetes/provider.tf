locals {
  macos_kubeconfig = "~/.kube/config"
  windows_kubeconfig = "C:/Users/philipp/.kube/config"
  context    = "rancher-desktop"
}

terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "kubernetes" {
  config_path = local.windows_kubeconfig
  config_context = local.context
}

provider "helm" {
    kubernetes {
        config_path = local.windows_kubeconfig
        config_context = local.context
    }
}