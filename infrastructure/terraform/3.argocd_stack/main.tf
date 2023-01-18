resource "kubernetes_namespace" "this" {
  metadata {
    labels = {
      environment = "Production"
    }
    name = "argocd"
  }
}

resource "helm_release" "argo" {
  name = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.this.id
  version    = "4.9.7"

  values = [
    file("manifests/application.yaml")
  ]
}
