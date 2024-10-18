vpic_cidr_block = "10.10.0.0/16"
env = "dev"
tags = {
  company = "xyz.co"
  bu_unit = "Finance"
  project_name = "expense"
}

public_subnets =    ["10.10.0.0/24    ,    10.10.0.1/24"]
web_subnets    =    ["10.10.0.2/24    ,    10.10.0.3/24"]
app_subnets    =    ["10.10.0.4/24    ,    10.10.0.5/24"]
db_subnets     =    ["10.10.0.6/24    ,    10.10.0.7/24"]

azs                    = ["us-east-1a", "us-east-1b"]
account_id             = "827956817277"
default_vpc_id         = "vpc-05d61a29df92cedf0"
default_route_table_id = "rtb-00fca9562f27c8a7c"
default_vpc_cidr       = "172.31.0.0/16"


rds_allocated_storage = 20
rds_engine            = "mysql"
rds_engine_version    = "5.7.44"
rds_instant_class     = "db.t3.micro"

backend =  {
app_port       = 8080
instance_count = 1
instance_type  = "t3.small"
}

frontend = {
  app_port       = 80
  instance_count = 1
  instance_type  = "t3.small"
}
bastion_cidrs = ["172.31.46.160/32"]
prometheous_cidrs = ["172.31.46.200/32"]

public_alb = {
  internal     = false
  lb_port      = 80
  type         = "public"
  component    = "frontend"
  enable_https = true
  ingress = {
    http  = { port = 80 }
    https = { port = 443 }
  }
}

public_alb = {
  internal = false
  lb_port  = 80
  type     = "public"
  component = "frontend"
  enable_https = true
  ingress = {
    http = { port = 80 }
    https = { port = 44 }
  }
}

backend_alb = {
  internal  = true
  lb_port   = 80
  type      = "backend"
  component = "backend"
  enable_https = false
  ingress = {
    http = { port = 80 }
  }

}

route53_zone_id = "Z05815251wqO0ok50UPQR"
kms             = "arn:aws:kms:us-east-1:827956817277:key/42af000f-94d6-4913-a952-14877c37a92e"
certificate_arn = "arn:aws:acm:us-east-1:827956817277:certificate/3841c970-14da-4ec8-84d4-4f62d433c424"






