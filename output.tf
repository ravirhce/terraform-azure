output "public_ip_address" {
  description = "this is the public ip of your instance"
  value       = azurerm_windows_virtual_machine.myvm[*].public_ip_addresses    
  }

output "vnet" {
    description = "this is the virtual network of your instance"
    value       = azurerm_virtual_network.myvnet[*].name
  
}