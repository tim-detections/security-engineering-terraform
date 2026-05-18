# ==========================================
# PROD ENVIRONMENT: SENTINEL ROUTER
# ==========================================

# 1. Route to Identity Detections
module "identity_rules" {
  source = "../../detections/sentinel/identity"

  log_analytics_workspace_id = var.log_analytics_workspace_id
}
