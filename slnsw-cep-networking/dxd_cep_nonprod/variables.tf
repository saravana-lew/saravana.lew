variable "aws_region" {}
variable "aws_profile" {}

### vpc
variable "vpc_cep_test_name" {}
variable "vpc_cep_stg_name" {}
variable "enable_dns_hostnames" {}
variable "enable_dns_support" {}

variable "vpc_cep_test_cidr" {}
variable "vpc_cep_stg_cidr" {}
variable "cep_test_subnet_cidrs" {  
  type = "map"
}
variable "cep_stg_subnet_cidrs" {  
  type = "map"
}
variable "cidrs" {  
  type = "map"
}

variable "test_public1_2a_sn" {}
variable "test_public2_2b_sn" {}
variable "test_public3_2c_sn" {}

variable "test_private1_2a_sn" {}
variable "test_private2_2b_sn" {}
variable "test_private3_2c_sn" {}

variable "test_private4_2a_sn" {}
variable "test_private5_2b_sn" {}
variable "test_private6_2c_sn" {}


variable "stg_public1_2a_sn" {}
variable "stg_public2_2b_sn" {}
variable "stg_public3_2c_sn" {}

variable "stg_private1_2a_sn" {}
variable "stg_private2_2b_sn" {}
variable "stg_private3_2c_sn" {}

variable "stg_private4_2a_sn" {} 
variable "stg_private5_2b_sn" {}
variable "stg_private6_2c_sn" {}

variable "test_dmz_nacl" {} 
variable "test_lambda_nacl" {} 
variable "test_db_nacl" {} 

variable "stg_dmz_nacl" {} 
variable "stg_lambda_nacl" {} 
variable "stg_db_nacl" {} 

variable "test_dmz_rt" {}
variable "test_lambda_rt" {}
variable "test_db_rt" {}

variable "stg_dmz_rt" {}
variable "stg_lambda_rt" {}
variable "stg_db_rt" {}

variable "test_igw" {}
variable "stg_igw" {}

variable "test_dhcpoptions" {}
variable "stg_dhcpoptions" {}


