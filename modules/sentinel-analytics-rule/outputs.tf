output "rule_id" {
  description = "The ID of the deployed Sentinel Rule."
  value       = azurerm_sentinel_alert_rule_scheduled.rule.id
}
