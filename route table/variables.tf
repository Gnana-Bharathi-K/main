# Global variables
variable "location" {
  description = "Azure Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "route_table_name" {
  description = "Route Table Name"
  type        = string
}

variable "disable_bgp_route_propagation" {
  description = "Option to disable BGP route propagation on this Route Table."
  type        = bool
  default     = false
}

variable "enable_force_tunneling" {
  description = "Option to enable a route to Force Tunneling (force 0.0.0.0/0 traffic through the Gateway next hop)."
  type        = bool
  default     = false
}

variable "route_name" {
  description = "Route Name"
  type        = string
  default     = "InternetForceTunneling"
}

variable "tags" {
  type        = map(string)
  description = "Tags help you manage, identify, organize search and filter resources."
}

