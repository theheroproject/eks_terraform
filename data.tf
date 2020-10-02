data "template_file" "kube_config" {
  template = file("./templates/kube_config.yaml.tpl")

  vars = {
    CERTIFICATE = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    MASTER_ENDPOINT = data.aws_eks_cluster.cluster.endpoint
    CLUSTER_NAME = "demo-eks-20201002"
  }
}
