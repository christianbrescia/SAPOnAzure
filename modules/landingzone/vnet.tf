resource "azurerm_virtual_network" "this" {
  name = "vnet"
  resource_group_name = "rg"
  location = "location"
  address_space = [ "10.10.0.0/22" ]
  tags = {}
}

resource "azurerm_route_table" "this" {
  name = "rt"
  resource_group_name = "rg"
  location = "location"
}

resource "azurerm_route" "this" {
  for_each = local.routes
  name = each.key
  resource_group_name = "rg"
  route_table_name = azurerm_route_table.this.name
  address_prefix = each.value.prefix
  next_hop_type = "dd"
  next_hop_in_ip_address = ""
}