locals {
  macos_kubeconfig = "~/.kube/config"
  windows_kubeconfig = "C:/Users/philipp/.kube/config"
  rancher_context    = "rancher-desktop"
  docker_desktop_context = "docker-desktop"
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
  config_path = local.macos_kubeconfig
  config_context = local.docker_desktop_context
}

provider "helm" {
    kubernetes {
        config_path = local.macos_kubeconfig
        config_context = local.docker_desktop_context
    }
}