# terraform-aws-efs
This repository contains the terraform module for AWS EFS 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.34 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Resources

| Name | Type |
|------|------|
| [aws_efs_file_system.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Create a new EFS file system | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Create a new security group for the EFS file system | `bool` | `true` | no |
| <a name="input_creation_token"></a> [creation\_token](#input\_creation\_token) | A unique name (a maximum of 64 characters are allowed) | `string` | `""` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | If true, the disk will be encrypted. | `bool` | `true` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the AWS Key Management Service (AWS KMS) customer master key (CMK) that will be used to protect the encrypted file system. | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying kms\_key\_id, encrypted needs to be set to true. | `string` | `""` | no |
| <a name="input_lifecycle_policy"></a> [lifecycle\_policy](#input\_lifecycle\_policy) | The file system's lifecycle policy. | `map(any)` | `{}` | no |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | The performance mode of the file system | `string` | `"generalPurpose"` | no |
| <a name="input_provisioned_throughput_in_mibps"></a> [provisioned\_throughput\_in\_mibps](#input\_provisioned\_throughput\_in\_mibps) | The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput\_mode set to provisioned. | `number` | `0` | no |
| <a name="input_security_group_name_prefix"></a> [security\_group\_name\_prefix](#input\_security\_group\_name\_prefix) | The name prefix of the security group. | `string` | `"efs-"` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | A map of security group  rule definitions to add to the security group created | `map(any)` | `{}` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of security group IDs to associate with EFS mount targets. | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The IDs of the subnets to associate the EFS file system with. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | Throughput mode for the file system. | `string` | `"bursting"` | no |
| <a name="input_transition_to_ia"></a> [transition\_to\_ia](#input\_transition\_to\_ia) | Indicates how long it takes to transition files to the IA storage class. Valid values: AFTER\_7\_DAYS, AFTER\_14\_DAYS, AFTER\_30\_DAYS, AFTER\_60\_DAYS, or AFTER\_90\_DAYS. | `string` | `"AFTER_30_DAYS"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC that the EFS file system will be associated with. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_arn"></a> [efs\_arn](#output\_efs\_arn) | The Amazon Resource Name (ARN) of the file system. |
| <a name="output_efs_dns_name"></a> [efs\_dns\_name](#output\_efs\_dns\_name) | DNS name for the EFS file system. |
| <a name="output_efs_id"></a> [efs\_id](#output\_efs\_id) | The ID that identifies the file system. |
| <a name="output_mount_target_ids"></a> [mount\_target\_ids](#output\_mount\_target\_ids) | List of the mount target IDs. |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | Name of the security group that is associated with the mount target. |
| <a name="output_security_groups"></a> [security\_groups](#output\_security\_groups) | List of security groups that are associated with the mount target. |
<!-- END_TF_DOCS -->