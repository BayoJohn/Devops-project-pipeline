terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "minikube" {
  kubernetes_version = "v1.30.0"
}

resource "minikube_cluster" "minikube_docker" {
  driver       = "docker"
  cluster_name = "Devop-project"
  
  # Crucial: Gives the cluster 15 mins to pull images and start the API
  wait_timeout = 15

  addons = [
    "default-storageclass",
    "storage-provisioner"
  ]
}

# This resource proves that the connection between Minikube and Kubernetes works
resource "kubernetes_namespace" "dev_namespace" {
  metadata {
    name = "my-devop-app"
  }

  # This tells Terraform: "Wait until the cluster is 100% ready before trying this"
  depends_on = [minikube_cluster.minikube_docker]
}