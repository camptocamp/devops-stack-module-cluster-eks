variable "cluster_name" {
  description = "Name of the EKS cluster. Must be unique in the AWS account."
  type        = string
}

variable "base_domain" {
  description = <<-EOT
    The base domain for the cluster.

    This module needs a Route 53 zone matching this variable with permission to create DNS records. It will create a wildcard CNAME record `*.<subdomain>.<base_domain>` that points to an Elastic Load Balancer routing ingress traffic to all cluster nodes. Such urls will be used by default by other DevOps Stack modules for the applications they deploy (e.g. Argo CD, Prometheus, etc).
  EOT
  type        = string
  default     = null
}

variable "subdomain" {
  description = "The subdomain used for ingresses."
  type        = string
  default     = "apps"
  nullable    = false
}

variable "kubernetes_version" {
  description = <<-EOT
    Kubernetes `<major>.<minor>` version to use for the EKS cluster.

    See https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html[AWS EKS documentation] for a list of available versions.

    If you do not specify a value, the latest available version at creation is used and no upgrades will occur except those automatically triggered by EKS.

    The value can be set and increased on an existing cluster to upgrade it. *Note that this triggers a rolling replacement of the compute nodes, so all pods will be recreated*.
  EOT
  type        = string
  default     = null
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vpc_id" {
  description = "ID of the VPC where the cluster and nodes will be deployed."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of IDs of private subnets that the EKS instances will be attached to."
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of IDs of public subnets the public NLB will be attached to if enabled with 'create_public_nlb'."
  type        = list(string)
  default     = []
}

variable "node_groups" {
  description = "A map of node group configurations to be created."
  type        = any
  default     = {}
}

variable "use_self_managed_node_groups" {
  description = <<-EOT
    Whether to use self-managed node groups instead of EKS managed node groups.

    EKS managed node groups have the advantage of automatically draining the nodes when instances are being replaced.

    **You should set this variable to `true` on clusters deployed with a module earlier than v3 because it created self-managed node groups exclusively.**

    Changing this on an existing cluster is not supported (although it is possible with some downtime and manual fixes to the load balancer target groups).
  EOT
  type        = bool
  default     = false
}

variable "create_public_nlb" {
  description = "Whether to create an internet-facing NLB attached to the public subnets"
  type        = bool
  default     = true
}

variable "create_private_nlb" {
  description = "Whether to create an internal NLB attached the private subnets"
  type        = bool
  default     = false
}

variable "nlb_attached_node_groups" {
  description = "List of node_groups indexes that the NLB(s) should be attached to"
  type        = list(any)
  default     = []
}

variable "lb_target_groups" {
  description = <<-EOT
    Target Groups to attach to Network LBs (overrides the default target groups).

    A list of maps containing key/value pairs that define the target groups.
  EOT
  type = list(object({
    name_prefix      = string
    backend_protocol = string
    backend_port     = number
    target_type      = optional(string)
  }))
  default = null
}

variable "extra_lb_http_tcp_listeners" {
  description = <<-EOT
    Additional Listeners to attach to Network LBs.

    A list of maps describing the HTTP listeners. Required key/values: `port`, `protocol`. Optional key/values: `target_group_index` (defaults to `http_tcp_listeners[count.index]`).
  EOT
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "Tags to apply to all resources created by the EKS Terraform module."
  type        = map(string)
  default     = {}
}

variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable."
  type        = list(string)
  default     = ["audit", "api", "authenticator"]
}

variable "access_entries" {
  description = "Map of access entries to add to the cluster. The type of the variable is `any` similarly to the upstream EKS module. Please check the https://github.com/terraform-aws-modules/terraform-aws-eks[their README] for more information and examples."
  type        = any
  default     = {}
}
