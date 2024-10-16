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
