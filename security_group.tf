
locals {
  computed_security_groups = var.create_security_group ? concat([aws_security_group.this[0].id], var.security_groups) : var.security_groups
}


resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0

  name_prefix = var.security_group_name_prefix

  vpc_id = var.vpc_id

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "this" {
  for_each = { for k, v in var.security_group_rules : k => v if var.create_security_group }

  # Required
  security_group_id = aws_security_group.this[0].id
  protocol          = each.value.protocol
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  type              = each.value.type

  # Optional
  description              = try(each.value.description, null)
  cidr_blocks              = try(each.value.cidr_blocks, null)
  self                     = try(each.value.self, null)
  source_security_group_id = try(each.value.source_security_group_id, null)
}