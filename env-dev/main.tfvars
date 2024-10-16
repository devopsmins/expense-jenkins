vpic_cidr_block = "10.10.0.0/16"
env = "dev"
tags = {
  company = "xyz.co"
  bu_unit = "Finance"
  project_name = "expense"
}

public_subnets =    "[10.10.0.0/24    ,    10.10.0.1/24]"
web_subnets    =    "[10.10.0.2/24    ,    10.10.0.3/24]"
app_subnets    =    "[10.10.0.4/24    ,    10.10.0.5/24]"
db_subnets     =    "[10.10.0.6/24    ,    10.10.0.7/24]"
