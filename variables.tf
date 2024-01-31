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
  description = "Sub domain of the cluster. Value used for the ingress' URL of the application."
  type        = string
  default     = "apps"
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

variable "aws_auth_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
  default     = []
}

variable "aws_auth_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "aws_auth_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
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

variable "extra_lb_target_groups" {
  description = <<-EOT
    Additional Target Groups to attach to Network LBs.

    A list of maps containing key/value pairs that define the target groups. Required key/values: `name`, `backend_protocol`, `backend_port`.
  EOT
  type        = list(any)
  default     = []
}

variable "extra_lb_http_tcp_listeners" {
  description = <<-EOT
    Additional Listeners to attach to Network LBs.

    A list of maps describing the HTTP listeners. Required key/values: `port`, `protocol`. Optional key/values: `target_group_index` (defaults to `http_tcp_listeners[count.index]`).
  EOT
  type        = list(any)
  default     = []
}
