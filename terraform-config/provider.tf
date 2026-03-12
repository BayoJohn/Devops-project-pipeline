provider "kubernetes" {
  host = minikube_cluster.minikube_docker.host
  
  # Removed the 's' from certificate
  client_certificate     = minikube_cluster.minikube_docker.client_certificate
  
  client_key             = minikube_cluster.minikube_docker.client_key
  
  # Fixed the spelling of "minikube"
  cluster_ca_certificate = minikube_cluster.minikube_docker.cluster_ca_certificate
}