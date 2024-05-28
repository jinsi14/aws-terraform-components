# variables.tf

variable "instance_id" {
  description = "The Amazon Connect instance ID."
  type        = string
  default     = "b357b9d8-7a28-408e-abb3-403d5846706b"
}

variable "contact_flow_name1" {
  description = "List of Amazon Connect contact flow names."
  type        = string
  default     = "jb_dnis_EntryPreActions"
}

variable "queue_name1" {
  description = "List of Amazon Connect queue names."
  type        = string
  default     = "jb_dnis_error"
}

variable "queue_name2" {
  description = "List of Amazon Connect queue names."
  type        = string
  default     = "BasicQueue"
}

variable "aws_region" {
  description = "The AWS region where the resources are located."
  type        = string
  default     = "us-west-2"
}

variable "dashboard_name" {
  description = "The name of the CloudWatch dashboard."
  type        = string
  default     = "AmazonConnectMonitoringDashboard"
}

variable "table_name1" {
  description = "The name of the first DynamoDB table"
  type        = string
  default     = "c1-dyndb-agent-desktop-agentaddress-table1-usw2-sandbox"
}

variable "table_name2" {
  description = "The name of the second DynamoDB table"
  type        = string
  default     = "ccp-chat-us-west-2-chatContactDataTable-1VUEYEVT9JGNI"
}

variable "delivery_stream_name" {
  description = "The name of the Delivery stream for firehose"
  type        = string
  default     = "cla-n-firehose-internal-connect-usw2-sandbox"
}

variable "stream_name1" {
  description = "The name of the first Kinesis Stream"
  type        = string
  default     = "cla-n-kds-internal-connect-usw2-sandbox"
}
variable "stream_name2" {
  description = "The name of the second Kinesis Stream"
  type        = string
  default     = "cla-n-kds-internal-connect-agent-events-usw2-sandbox"
}
variable "lambda_function_name1" {
  description = "The name of First Lambda function"
  type        = string
  default     = "jb-lmda-lob-etl-eus1-digi-development-func"
}

variable "lambda_function_name2" {
  description = "The name of Second Lambda function"
  type        = string
  default     = "jetblue-development-func"
}
variable "db_cluster_identifier" {
  description = "The name of the RDS cluster"
  type        = string
  default     = "jb-rds-internal-agent-desktop-etl-usw2-sandbox-poc1"
}
variable "db_instance_identifier" {
  description = "The name of Sthe RDS instance"
  type        = string
  default     = "jb-rds-internal-agent-desktop-etl-usw2-sandbox-poc1-one"
}