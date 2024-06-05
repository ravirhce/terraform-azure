resource "azurerm_virtual_network" "myvnet" {
  name                = "mytfvnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"] # CIDR notation
}                                       # End of the file  

resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"] # CIDR notation
}                                        # End of the file
resource "azurerm_public_ip" "mypip" {
  name                = "mytfpip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
} # End of the file

resource "azurerm_network_interface" "mynic" {
  name                = "mytfnic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "mytfipconfig"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypip.id
  }
} # End of the file