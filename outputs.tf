output "efs_id" {
  description = "The ID that identifies the file system."
  value       = try(aws_efs_file_system.this[0].id, "")
}

output "efs_arn" {
  description = "The Amazon Resource Name (ARN) of the file system."
  value       = try(aws_efs_file_system.this[0].arn, "")
}

output "mount_target_ids" {
  description = "List of the mount target IDs."
  value       = try(aws_efs_mount_target.this.*.id, "")
}

output "efs_dns_name" {
  description = "DNS name for the EFS file system."
  value       = try(aws_efs_file_system.this[0].dns_name, "")
}

output "security_group_name" {
  description = "Name of the security group that is associated with the mount target."
  value       = var.create_security_group ? aws_security_group.this[0].name : ""
}

output "security_groups" {
  value       = local.computed_security_groups
  description = "List of security groups that are associated with the mount target."
}