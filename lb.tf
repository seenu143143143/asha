
#Resource Group
data "azurerm_resource_group" "rg" {
  name = var.rg
}

data "azurerm_resource_group" "rgforvnet" {
name = var.rgforvnet

}

#Virtual network
data "azurerm_virtual_network" "vnet" {
  name                 = var.vnet
  resource_group_name  = var.rgforvnet
}

#Subnet
data "azurerm_subnet" "subnetname" {
  name                 = var.subnetname
  virtual_network_name = var.vnet
  resource_group_name  = var.rgforvnet
}

# load balancer
resource "azurerm_lb" "Load_balancer" {
  name                = var.lbname
  location            = var.location
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  sku                 = "Standard"
  frontend_ip_configuration {
    name                          = "frontend"
    subnet_id                     = "${data.azurerm_subnet.subnetname.id}"
    private_ip_address            = "10.3.34.115"
    private_ip_address_allocation = "Static"
  }
}
resource "azurerm_lb_backend_address_pool" "lb_backend" {
  loadbalancer_id = azurerm_lb.Load_balancer.id
  name            = var.backendpool
  resource_group_name = "${data.azurerm_resource_group.rg.name}"

}

# Probe
resource "azurerm_lb_probe" "albp-01" {
  name                = "lbprobe"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  port                = 80
  protocol            = "tcp"
  interval_in_seconds = 15
  number_of_probes    = 2
  loadbalancer_id     = azurerm_lb.Load_balancer.id
}

# Probe2
resource "azurerm_lb_probe" "albp-02" {
  name                = "lbprobe2"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  port                = 443
  protocol            = "tcp"
  interval_in_seconds = 15
  number_of_probes    = 2
  loadbalancer_id     = azurerm_lb.Load_balancer.id
}
