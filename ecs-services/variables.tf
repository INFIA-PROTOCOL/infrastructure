// availability zones
data "aws_availability_zones" "available" {}

// global terraform
data "terraform_remote_state" "global" {
  backend = "s3"
  config {
    bucket = "kr.sideeffect.terraform.state"
    key = "global/terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
    lock_table = "SideEffectTerraformStateLock"
    acl = "bucket-owner-full-control"
  }
}

// vpc terraform
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "kr.sideeffect.terraform.state"
    key = "vpc/terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
    lock_table = "SideEffectTerraformStateLock"
    acl = "bucket-owner-full-control"
  }
}
