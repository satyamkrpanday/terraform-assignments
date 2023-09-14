resource "aws_s3_bucket" "terraform-state-bucket" {
  for_each = var.iterations
  bucket = each.value.name_bucket
  tags = {
    Name = each.value.name
    owner=each.value.owner
    purpose=each.value.purpose
  }
}


resource "aws_instance" "ec2-instance" {
count=2
instance_type = var.instance_type[count.index]
ami = var.amis[count.index]
subnet_id = var.subnet_id[count.index] 
tags = {
  Name=var.name
    owner=var.owner
  purpose=var.assignment
  
}
volume_tags = {
  Name=var.name
  owner=var.owner
  purpose=var.assignment
} 
}


