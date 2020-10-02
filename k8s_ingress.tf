resource "kubernetes_namespace" "kube_ingress" {
  metadata {
    name = "kube-ingress"
  }
}

resource "helm_release" "nginx_ingress_admin" {
  name  = "nginx-ingress-admin"
  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "nginx-ingress"
  wait       = "false"

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }

//   values = [
//     "${file("helm-values/nginx-ingress-admin-values.yml")}"
//   ]

}