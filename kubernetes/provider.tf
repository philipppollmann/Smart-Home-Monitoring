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
  config_path = "~/.kube/config"
  config_context = "docker-desktop"
}

provider "helm" {
    kubernetes {
        config_path = "~/.kube/config"
        config_context = "docker-desktop"
    }
  
}

/*provider "supabase" {
  access_token = ""
  endpoint = ""
}*/