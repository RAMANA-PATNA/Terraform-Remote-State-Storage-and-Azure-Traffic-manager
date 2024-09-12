/*
Resource : azurerm_moniotor_atuoscale_setting
- Notification block
- Profile 
    1. Capacity block
    2. Percentage CPU metric rule
        - Scale UP : Increase VMs by 1 when the percentage CPU is greater than 75
        - Scale IN : Decrease VMs by 1 when the percentage CPU is less than 25
    3. Available memory in bytes metric rule
        - Scale UP : inCREASE vmS by 1 when the Available memoey in bytes less than 1 GB
        - Scale IN : Decrease VMs by 1 when the Available memory in bytes greater than 2 GB
    
*/

resource "azurerm_monitor_autoscale_setting" "web_vmss" {
  name = "${local.resource_name_prefix}-web-vmss"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  target_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
  # Notification block
  notification {
    email {
      custom_emails = ["myaminteam@ourorg.com"]
    }
  }

  #############################################################################################
  #############################################################################################
  ####################                profile -1 Default profile               ################
  #############################################################################################
  #############################################################################################

  # Profile 1 : Default profile
  profile {
    name = "Default"

    capacity {
      default = 3
      minimum = 3
      maximum = 6
    }

    #### START : Percentage CPU metric rule ########

    ## Scale UP
    rule {
      scale_action {
        direction = "Increase"
        type = "ChangeCount"
        value = 1
        cooldown = "PT5M"
      }

      metric_trigger {
        metric_name = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
        metric_namespace = "microsoft.compute/virtualmachinescalesets"
        time_grain = "PT1M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "GreaterThan"
        threshold = 75
      }
    }

    ## Scale IN

    rule {
      scale_action {
        direction = "Decrease"
        type = "ChangeCount"
        value = 1
        cooldown = "PT5M"
      }

      metric_trigger {
        metric_name = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
        metric_namespace = "microsoft.compute/virtualmachinescalsesets"
        time_grain = "PT1M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "LessThan"
        threshold = 25
      }
    }

    #########   END : Percentage CPU metric rule ###########


    ####  START : Available Memory in Bytes metric rule ###########

    ## Scale Up
    rule {
      scale_action {
        direction = "Increase"
        type = "ChangeCount"
        value = 1
        cooldown = "PT5M"
      }

      metric_trigger {
        metric_name = "Available Memory Bytes"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
        metric_namespace = "microsft.compute/virtualmachinescalsesets"
        time_grain = "PT1M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "LessThan"
        threshold = 1073741824 # Increase VMs by 1 when Available memory in bytes less than 1 GB
      }
    }

    ## Scale in
    rule {
      scale_action {
        direction = "Decrease"
        type = "ChangeCount"
        value = 1
        cooldown = "PT5M"
      }

      metric_trigger {
        metric_name = "Available Memory Bytes"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
        metric_namespace = "microsoft.compute/virtualmachinescalsesets"
        time_grain = "PT5M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "GreaterThan"
        threshold = 2147483648  #Decrease VMs by 1 when Availabel memory in bytes greater than 2GB
      }
    }
  }
}
