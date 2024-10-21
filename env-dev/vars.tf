terraform {
  backend  "s3" {
  bucket = "mins-terraform-state"
    key = "parameter-store/terraform.tfstate"
    region = "us-east-1a"
  }
}

variable "parameters" {
  default = ""
}

resource "aws_ssm_parameter" "params" {
  for_each = var.parameters
  name = each.key
  type = each.value["type"]
  value = each.value["value"]
  overwrite = "true"
  arn = ""

}