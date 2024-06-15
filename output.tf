output "public_ip_address" {
  description = "this is the public ip of your instance"
  value       = azurerm_windows_virtual_machine.myvm[*].public_ip_addresses    
  }