resource "kubernetes_namespace" "fn" {
  metadata {
    name = "openfaas-fn"
  }
}

resource "kubernetes_deployment" "function" {
  metadata {
    name      = "hello-fn"
    namespace = kubernetes_namespace.fn.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "hello-fn"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello-fn"
        }
      }

      spec {
        container {
          name  = "hello-fn"
          image = var.image

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "function" {
  metadata {
    name      = "hello-fn-svc"
    namespace = kubernetes_namespace.fn.metadata[0].name
  }

  spec {
    selector = {
      app = "hello-fn"
    }

    port {
      port        = 80
      target_port = 8080
    }

    type = "NodePort"
  }
}