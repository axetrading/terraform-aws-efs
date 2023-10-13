resource "aws_efs_file_system" "this" {
  count = var.create ? 1 : 0

  creation_token                  = var.creation_token
  performance_mode                = var.performance_mode
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_arn
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = [for k, v in var.lifecycle_policy : { (k) = v }]

    content {
      transition_to_ia                    = try(lifecycle_policy.value.transition_to_ia, null)
      transition_to_primary_storage_class = try(lifecycle_policy.value.transition_to_primary_storage_class, null)
    }
  }

  tags = var.tags
}

resource "aws_efs_mount_target" "this" {
  for_each = var.create ? toset(var.subnet_ids) : []

  file_system_id  = aws_efs_file_system.this[0].id
  subnet_id       = each.value
  security_groups = local.computed_security_groups
}
