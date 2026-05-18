variable "name" {
  type        = string
  description = "The unique GUID for the Sentinel rule."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The Log Analytics Workspace ID."
}

variable "display_name" {
  type        = string
  description = "The title of the alert rule."
}

variable "severity" {
  type        = string
  description = "High, Medium, Low, or Informational."
}

variable "query" {
  type        = string
  description = "The KQL query. Passed in dynamically using the file() function."
}

variable "description" {
  type        = string
  default     = "Deployed via Terraform CI/CD"
}

variable "enabled" {
  type        = bool
  default     = true
}

variable "query_frequency" {
  type        = string
  default     = "PT1H" # Default 1 Hour
}

variable "query_period" {
  type        = string
  default     = "P14D" # Default 14 Days Lookback
}

variable "trigger_operator" {
  type        = string
  default     = "GreaterThan"
}

variable "trigger_threshold" {
  type        = number
  default     = 0
}

variable "tactics" {
  type        = list(string)
  default     = []
}

variable "techniques" {
  type        = list(string)
  default     = []
}

# The Senior Engineer Flex: Dynamic Entity Mappings
variable "entity_mappings" {
  type = list(object({
    entity_type = string
    field_mappings = list(object({
      identifier  = string
      column_name = string
    }))
  }))
  default = []
}
