module "password_spray_rule" {
  source                     = "../../../modules/sentinel-analytics-rule"
  
  # A unique ID for Azure (can be any unique string or UUID)
  name                       = "UC0006-AAD-PasswordSpray-Rule" 
  
  display_name               = "AAD PasswordSpray With One Successful Correlation"
  description                = "Detects password spray behavior in Azure AD by identifying multiple failed authentication attempts across several users from a single IP within a 30-minute window. Correlates whether the spray resulted in successful login."
  
  # Turn the rule off
  enabled                    = false
  
  # Calling the KQL file we just created
  query                      = file("${path.module}/../../../queries/sentinel/identity/password_spray.kql")
  
  severity                   = "High"
  tactics                    = ["CredentialAccess", "InitialAccess"]
  techniques                 = ["T1110", "T1078"] # Removed the .003 sub-technique as Terraform standard accepts parent techniques best
  
  # Passing the workspace ID from your environment switchboard
  log_analytics_workspace_id = var.log_analytics_workspace_id
}
