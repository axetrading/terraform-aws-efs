variable "create" {
  type        = bool
  description = "Create a new EFS file system"
  default     = true
}

variable "create_security_group" {
  type        = bool
  description = "Create a new security group for the EFS file system"
  default     = true
}

variable "creation_token" {
  description = "A unique name (a maximum of 64 characters are allowed)"
  type        = string
  default     = ""
}

variable "performance_mode" {
  description = "The performance mode of the file system"
  type        = string
  default     = "generalPurpose"
}

variable "throughput_mode" {
  description = "Throughput mode for the file system."
  type        = string
  default     = "bursting"
}

variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to provisioned."
  type        = number
  default     = 0
}

variable "encrypted" {
  description = "If true, the disk will be encrypted."
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
  type        = string
  default     = ""
}

variable "transition_to_ia" {
  description = "Indicates how long it takes to transition files to the IA storage class. Valid values: AFTER_7_DAYS, AFTER_14_DAYS, AFTER_30_DAYS, AFTER_60_DAYS, or AFTER_90_DAYS."
  type        = string
  default     = "AFTER_30_DAYS"
}

variable "subnet_ids" {
  description = "The IDs of the subnets to associate the EFS file system with."
  type        = list(string)
}

variable "security_groups" {
  description = "A list of security group IDs to associate with EFS mount targets."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the AWS Key Management Service (AWS KMS) customer master key (CMK) that will be used to protect the encrypted file system."
  type        = string
  default     = null # or provide a default ARN
}

variable "lifecycle_policy" {
  description = "The file system's lifecycle policy."
  type        = map(any) # Adjust this type based on the structure of your lifecycle policy
  default     = {}       # or provide a default policy
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC that the EFS file system will be associated with."
  default     = null
}

variable "security_group_name_prefix" {
  type        = string
  description = "The name prefix of the security group."
  default     = "efs-"
}

variable "security_group_rules" {
  description = "A map of security group  rule definitions to add to the security group created"
  type        = map(any)
  default     = {}
}