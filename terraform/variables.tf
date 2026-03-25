variable "kubeconfig_path" {
  default = "~/.kube/config"
}

variable "image" {
  description = "Docker image for function"
}