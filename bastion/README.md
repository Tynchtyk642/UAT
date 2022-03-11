# AWS Bastion host Terraform module

## This module will create:
- _SSH Bastion host_

## **Diagram**
![](diagram/bastion.png)

## **Usage**
```terraform
module "bastion" {
  source = "./bastion" # <== Path to bastion module.

  bastion_name          = var.bastion_name
  bucket_name           = "s3-for-public-key"
  region                = "us-east-1"
  vpc_id                = module.networking.vpc_id
  is_lb_private         = true
  bastion_host_key_pair = aws_key_pair.test.key_name




  elb_subnets         = module.networking.public_subnets
  autoscaling_subnets = module.networking.public_subnets

  tags = {
    name        = "my_bastion_name"
    description = "my_bastion_description"
  }
}
```

```bash
export AWS_ACCESS_KEY_ID=<write your access key id>
export AWS_SECRET_ACCESS_KEY=<write you secret access key>
export AWS_DEFAULT_REGION=<write default region to create resource in>
```

Then perform the following commands on the root folder:
- `terraform init` terraform initialization
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply infrastructure build
- `terraform destroy` to destroy the infrastructure

## **Resources**
|Name|Type|
|----|----|
|[aws_iam_role.bastion_host_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)|resource|
|[aws_iam_policy.bastion_host_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)|resource|
|[aws_iam_role_policy_attachment.bastion_host](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment)|resource|
|[aws_iam_instance_profile.bastion_host_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile)|resource|
|[aws_launch_template.bastion_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template)|resource|
|[aws_autoscaling_group.bastion_auto_scaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)|resource|
|[aws_security_group.private_instances_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)|resource|
|[aws_security_group_rule.ingress_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)|resource|
|[aws_security_group_rule.egress_bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)|resource|
|[aws_security_group.bastion_host_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)|resource|
|[aws_security_group_rule.ingress_bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)|resource|
|[aws_lb.bastion_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)|resource|
|[aws_lb_target_group.bastion_lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group)|resource|
|[aws_lb_listener.bastion_lb_listener_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)|resource|
|[aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)|resource|
|[aws_s3_bucket_acl.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl)|resource|
|[aws_s3_bucket_server_side_encryption_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration)|resource|
|[aws_s3_bucket_versioning.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning)|resource|
|[aws_s3_bucket_lifecycle_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration)|resource|
|[aws_s3_object.bucket_public_keys_readme](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object)|resource|
|[aws_kms_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key)|resource|
|[aws_kms_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias)|resource|
|[aws_kms_alias.kms-ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_alias)|data source|
|[aws_ami.amazon-linux-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)|data source|
|[aws_subnet.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet)|data source|


