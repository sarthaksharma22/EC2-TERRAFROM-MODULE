provider "aws" {
  
}

resource "aws_instance" "this" {
  count                      = var.create_instance ? 1 : 0
  ami                        = var.ami
  instance_type              = var.instance_type
  key_name                   = var.key_name
  subnet_id                  = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids     = var.security_group_ids

  tags = merge({
    Name = var.instance_name
  }, var.tags)

  user_data = var.user_data

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices
    content {
      device_name           = ebs_block_device.value.device_name
      volume_size           = ebs_block_device.value.volume_size
      delete_on_termination = ebs_block_device.value.delete_on_termination
    }
  }
}
