data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = coalesce(var.location, data.azurerm_resource_group.main.location)
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags = merge(var.tags, {
    ControlledBy = "Terraform"
    git_commit   = "2ed8e208ad836f21aadceb491e37f7ccb9c5dde8"
    yor_trace    = "ab8541d2-f992-4d44-999d-823738a62f2a"
  })
}

resource "azurerm_route" "force_internet_tunneling" {
  name                = var.route_name
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "VirtualNetworkGateway"

  count = var.enable_force_tunneling ? 1 : 0
}