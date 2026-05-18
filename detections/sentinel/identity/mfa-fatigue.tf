variable "log_analytics_workspace_id" {
  description = "The resource ID of the Log Analytics workspace"
  type        = string
}

module "mfa_fatigue_rule" {
  source                     = "../../../modules/sentinel-analytics-rule"
  
  # Azure Architecture Variables
  log_analytics_workspace_id = var.log_analytics_workspace_id
  
  # Rule Definition
  name                       = "d7a819b2-3e4f-4a6c-9d8b-1e2f3a4b5c6d"
  display_name               = "Entra ID MFA Fatigue with Successful Authentication"
  severity                   = "High"
  tactics                    = ["CredentialAccess", "InitialAccess"]
  techniques                 = ["T1110", "T1621"]
  
  # Magically pulls your KQL from your queries folder!
  query                      = file("${path.module}/../../../queries/sentinel/identity/mfa_fatigue.kql")

  # Dynamic Mapping
  entity_mappings = [
    {
      entity_type = "Account"
      field_mappings = [{ identifier = "Name", column_name = "UserPrincipalName" }]
    },
    {
      entity_type = "IP"
      field_mappings = [{ identifier = "Address", column_name = "IPAddress" }]
    }
  ]
}
