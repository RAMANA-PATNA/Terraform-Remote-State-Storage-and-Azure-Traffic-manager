# Create null resources and Provisioners
resource "null_resource" "name" {
  depends_on = [ azurerm_linux_virtual_machine.bastion_host_linuxvm ]

  # Connection bloack for provisiones to connect Azure VM instance
  connection {
    type = "ssh"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }

  # File perovisioner : copies the terraform-azure.pem to /temp/terrafrom-key.pem
  provisioner "file" {
    source = "ssh-keys/terraform-azure.pem"
    destination = "/tmp/terraform-key.pem"
  }

  # Remote exe provisioner : Using the remote exe provisioner fix the private key permisions on Bastion host
  provisioner "remote-exec" {
    inline = [ "sudo chmod 400 /tmp/terraform-key.pem" ]
  }
}