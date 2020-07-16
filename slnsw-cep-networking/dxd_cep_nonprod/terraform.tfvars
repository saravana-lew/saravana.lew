aws_profile       = "cep"
aws_region        = "ap-southeast-2"

vpc_cep_test_name = "dxd_cep_app_test_vpc"
vpc_cep_stg_name = "dxd_cep_app_stg_vpc"

enable_dns_hostnames = "true"
enable_dns_support =  "true"

vpc_cep_test_cidr = "172.29.64.0/19"
vpc_cep_stg_cidr = "172.29.96.0/19"


cep_test_subnet_cidrs       = {
  dxd_cep_app_test_lambda_private_2a_sn	  = "172.29.64.0/22"
  dxd_cep_app_test_lambda_private_2b_sn	  = "172.29.68.0/22"
  dxd_cep_app_test_lambda_private_2c_sn	  = "172.29.72.0/22"
  dxd_cep_app_test_dmz_public_2a_sn	  = "172.29.76.0/24"
  dxd_cep_app_test_dmz_public_2b_sn	  = "172.29.77.0/24"
  dxd_cep_app_test_dmz_public_2c_sn	  = "172.29.78.0/24"
  dxd_cep_app_test_db_private_2a_sn	  = "172.29.79.0/24"
  dxd_cep_app_test_db_private_2b_sn	  = "172.29.80.0/24"
  dxd_cep_app_test_db_private_2c_sn	  = "172.29.81.0/24"  
}

cep_stg_subnet_cidrs       = {
  dxd_cep_app_stg_lambda_private_2a_sn	  = "172.29.96.0/22"
  dxd_cep_app_stg_lambda_private_2b_sn	  = "172.29.100.0/22"
  dxd_cep_app_stg_lambda_private_2c_sn	  = "172.29.104.0/22"
  dxd_cep_app_stg_dmz_public_2a_sn	  = "172.29.108.0/24"
  dxd_cep_app_stg_dmz_public_2b_sn	  = "172.29.109.0/24"
  dxd_cep_app_stg_dmz_public_2c_sn	  = "172.29.110.0/24"
  dxd_cep_app_stg_db_private_2a_sn	  = "172.29.111.0/24"
  dxd_cep_app_stg_db_private_2b_sn	  = "172.29.112.0/24"
  dxd_cep_app_stg_db_private_2c_sn	  = "172.29.113.0/24"  
}


cidrs       = {
  public1	  = "172.29.64.0"
  public2	  = "172.29.64.0"
  public3	  = "10.1.2.0/24"  
  private2	= "10.1.4.0/24"
  rds1		  = "10.1.5.0/24"
  rds2		  = "10.1.6.0/24"
  rds3		  = "10.1.7.0/24"
}


test_public1_2a_sn = "dxd_cep_app_test_dmz_public_2a_sn"
test_public2_2b_sn = "dxd_cep_app_test_dmz_public_2b_sn"
test_public3_2c_sn = "dxd_cep_app_test_dmz_public_2c_sn"

test_private1_2a_sn = "dxd_cep_app_test_lambda_private_2a_sn"
test_private2_2b_sn = "dxd_cep_app_test_lambda_private_2b_sn"
test_private3_2c_sn = "dxd_cep_app_test_lambda_private_2c_sn"

test_private4_2a_sn = "dxd_cep_app_test_db_private_2a_sn" 
test_private5_2b_sn = "dxd_cep_app_test_db_private_2b_sn"
test_private6_2c_sn = "dxd_cep_app_test_db_private_2c_sn"


stg_public1_2a_sn = "dxd_cep_app_stg_dmz_public_2a_sn" 
stg_public2_2b_sn = "dxd_cep_app_stg_dmz_public_2b_sn"
stg_public3_2c_sn = "dxd_cep_app_stg_dmz_public_2c_sn"

stg_private1_2a_sn = "dxd_cep_app_stg_lambda_private_2a_sn"
stg_private2_2b_sn = "dxd_cep_app_stg_lambda_private_2b_sn"
stg_private3_2c_sn = "dxd_cep_app_stg_lambda_private_2c_sn"

stg_private4_2a_sn = "dxd_cep_app_stg_db_private_2a_sn" 
stg_private5_2b_sn = "dxd_cep_app_stg_db_private_2b_sn"
stg_private6_2c_sn = "dxd_cep_app_stg_db_private_2c_sn"

test_dmz_nacl = "dxd_cep_app_test_dmz_nacl"
test_lambda_nacl = "dxd_cep_app_test_lambda_nacl"
test_db_nacl = "dxd_cep_app_test_db_nacl"

stg_dmz_nacl = "dxd_cep_app_stg_dmz_nacl"
stg_lambda_nacl = "dxd_cep_app_stg_lambda_nacl"
stg_db_nacl = "dxd_cep_app_stg_db_nacl"


test_dmz_rt = "dxd_cep_app_test_dmz_rt"
test_lambda_rt = "dxd_cep_app_test_lambda_rt"
test_db_rt = "dxd_cep_app_test_db_rt"

stg_dmz_rt = "dxd_cep_app_stg_dmz_rt"
stg_lambda_rt = "dxd_cep_app_stg_lambda_rt"
stg_db_rt = "dxd_cep_app_stg_db_rt"

test_dhcpoptions = "dxd_cep_app_test_dhcpoptions"
stg_dhcpoptions = "dxd_cep_app_stg_dhcpoptions"

test_igw = "dxd_cep_app_test_igw"
stg_igw = "dxd_cep_app_stg_igw"