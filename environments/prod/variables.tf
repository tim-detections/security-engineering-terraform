# ==========================================
# PROD ENVIRONMENT: VARIABLES
# ==========================================

variable "subscription_id" {
  type        = string
  description = "The target Azure Subscription ID for the Production environment."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The complete Azure Resource ID for the Production Sentinel Workspace."
}
