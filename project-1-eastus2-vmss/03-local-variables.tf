## Local variables for this file
locals {
  owner = var.business_devision
  envirnoment = var.envirnoment
  resource_name_prefix = "${var.resource_group_location}-${var.business_devision}-${var.envirnoment}"

  common_tags = {
    owner = local.owner
    envirnoment = local.envirnoment
  }
}