output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = var.cluster_name
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.cluster.cluster_arn
}

output "base_domain" {
  description = "The base domain for the cluster."
  value       = local.base_domain
}

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider"
  value       = module.cluster.cluster_oidc_issuer_url
}

output "node_security_group_id" {
  description = "ID of the node shared security group"
  value       = module.cluster.node_security_group_id
}

output "node_groups" {
  description = "Map of attribute maps for all node groups created."
  value = merge(
    module.cluster.eks_managed_node_groups,
    module.cluster.self_managed_node_groups,
  )
}

output "kubernetes_host" {
  description = "Endpoint for your Kubernetes API server."
  value       = module.cluster.cluster_endpoint
}

output "kubernetes_cluster_ca_certificate" {
  description = "Certificate data required to communicate with the cluster."
  value       = base64decode(module.cluster.cluster_certificate_authority_data)
}

output "kubernetes_token" {
  description = "Token to use to authenticate with the cluster."
  value       = data.aws_eks_cluster_auth.cluster.token
}

output "nlb_dns_name" {
  description = "Map of the DNS names of the load balancers (public and/or private if enabled). Returns `null` if the respective load balancer is disabled."
  value = {
    public  = module.nlb.lb_dns_name
    private = module.nlb_private.lb_dns_name
  }
}

output "nlb_zone_id" {
  description = "Map of the zone_id of the load balancer to assist with creating DNS records (public and/or private if enabled). Returns `null` if the respective load balancer is disabled."
  value = {
    public  = module.nlb.lb_zone_id
    private = module.nlb_private.lb_zone_id
  }
}

output "nlb_target_groups" {
  description = "List of the target groups ARNs (public and/or private if enabled)."
  value       = concat(module.nlb.target_group_arns, module.nlb_private.target_group_arns)
}

output "kubernetes" {
  description = "Kubernetes API endpoint and CA certificate as a structured value."
  value = {
    host                   = module.cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.cluster.cluster_certificate_authority_data)
  }
}
