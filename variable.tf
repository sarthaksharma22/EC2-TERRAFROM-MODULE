variable "create_instance" {
  description = "Whether to create the EC2 instance."
  type        = bool
  default     = true
}

variable "ami" {
  description = "The ID of the AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use."
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for SSH access."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of the subnet where the instance will be deployed."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
}

variable "tags" {
  description = "Additional tags to assign to the instance."
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "The user data script to configure the instance."
  type        = string
  default     = ""
}

variable "ebs_block_devices" {
  description = "A list of EBS block devices to attach to the instance."
  type = list(object({
    device_name           = string
    volume_size           = number
    delete_on_termination = bool
  }))
  default = []
}
