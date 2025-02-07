resource "aws_instance" "roboshop" {
  for_each = var.instances #each.key and each.value
  ami           = data.aws_ami.joindevops.id
  instance_type = each.value
  vpc_security_group_ids = [var.allow_all]
  tags = {
    Name = each.key
  }
}