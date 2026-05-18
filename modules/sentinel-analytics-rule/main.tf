resource "azurerm_sentinel_alert_rule_scheduled" "rule" {
  name                       = var.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  display_name               = var.display_name
  severity                   = var.severity
  query                      = var.query
  description                = var.description
  enabled                    = var.enabled
  query_frequency            = var.query_frequency
  query_period               = var.query_period
  trigger_operator           = var.trigger_operator
  trigger_threshold          = var.trigger_threshold
  tactics                    = var.tactics
  techniques                 = var.techniques

  # Loops through the entities you provide and builds the Azure structure
  dynamic "entity_mapping" {
    for_each = var.entity_mappings
    content {
      entity_type = entity_mapping.value.entity_type
      
      dynamic "field_mapping" {
        for_each = entity_mapping.value.field_mappings
        content {
          identifier  = field_mapping.value.identifier
          column_name = field_mapping.value.column_name
        }
      }
    }
  }
}
