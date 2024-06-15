resource "azurerm_windows_virtual_machine" "myvm" {
  name                  = "mytfvm"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.mynic.id]
  size               = "Standard_B2as_v2"
  admin_username        = "var.admin_username"
  admin_password        = "var.admin_password"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Microsoftwindowsdesktop"
    offer     = "windows-11"
    sku       = "win11-23h2-pron"
    version   = "latest"
  }
} # End of the file

# Security Group - allowing RDP Connection
resource "azurerm_network_security_group" "sg-rdp-connection" {
  name                = "allowrdpconnection"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "rdpport"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Testing"
  }
}

# Associate security group with network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.mynic.id
  network_security_group_id = azurerm_network_security_group.sg-rdp-connection.id
}
