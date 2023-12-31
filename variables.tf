variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "AWS_SESSION_TOKEN" {
  type    = string
  default = null
}

variable "AWS_REGION" {
  type = string
}

variable "asg_name" {
  type        = string
  description = "(Optional) Name of the Auto Scaling Group. By default generated by Terraform."
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "(Optional) List of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside."
}

variable "desired_capacity" {
  type        = number
  description = "(Optional) Number of Amazon EC2 instances that should be running in the group."
}

variable "max_size" {
  type        = number
  description = "(Required) Maximum size of the Auto Scaling Group."
}

variable "min_size" {
  type        = number
  description = "(Required) Minimum size of the Auto Scaling Group."
}

variable "health_check_type" {
  type        = string
  default     = "ELB"
  description = "(Optional) 'EC2' or 'ELB'. Controls how health checking is done."
}

variable "target_group_arns" {
  type        = list(string)
  description = "(Optional) Set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing."
}

variable "launch_template_id" {
  type        = string
  description = "(Optional) ID of the launch template."
}

variable "launch_template_version" {
  type        = string
  default     = "$Latest"
  description = "(Optional) Template version. Can be version number, $Latest, or $Default."
}

variable "asg_tag_key" {
  type    = string
  default = "launch_template_version"
}

variable "instance_refresh" {
  type = object({
    strategy = optional(string, "Rolling")
    triggers = optional(list(string), ["tag"])
  })
}
