data "aws_availability_zones" "available" {}



# VPC
resource "aws_vpc" "dxd_cep_app_test_vpc" {
  cidr_block = "${var.vpc_cep_test_cidr}"
  instance_tenancy = "dedicated"
  enable_dns_hostnames = "${var.enable_dns_hostnames}" 
  enable_dns_support   = "${var.enable_dns_support}"   

  tags = {
    Name = "${var.vpc_cep_test_name}"
  }     
}

resource "aws_vpc" "dxd_cep_app_stg_vpc" {
  cidr_block = "${var.vpc_cep_stg_cidr}"
  instance_tenancy = "dedicated"
  enable_dns_hostnames = "${var.enable_dns_hostnames}" 
  enable_dns_support   = "${var.enable_dns_support}"   

  tags = {
    Name = "${var.vpc_cep_stg_name}"
  }     
}


#internet gateway

resource "aws_internet_gateway" "test_internet_gateway" {
  vpc_id = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  tags = {
    Name = "${var.test_igw}"
  }
}

resource "aws_internet_gateway" "stg_internet_gateway" {
  vpc_id = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  tags = {
    Name = "${var.stg_igw}"
  }
}


# Route tables

resource "aws_route_table" "test_dmz_rt" {
  vpc_id = "${aws_vpc.dxd_cep_app_test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test_internet_gateway.id}"
  }

  tags = {
    Name = "${var.test_dmz_rt}"
  }
}

resource "aws_route_table" "test_lambda_rt" {
  vpc_id = "${aws_vpc.dxd_cep_app_test_vpc.id}"

  tags = {
    Name = "${var.test_lambda_rt}"
  }
}

resource "aws_route_table" "test_db_rt" {
  vpc_id = "${aws_vpc.dxd_cep_app_test_vpc.id}"

  tags = {
    Name = "${var.test_db_rt}"
  }
}

### stg_igw

resource "aws_route_table" "stg_dmz_rt" {
  vpc_id = "${aws_vpc.dxd_cep_app_stg_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.stg_internet_gateway.id}"
  }

  tags = {
    Name = "${var.stg_dmz_rt}"
  }
}

resource "aws_route_table" "stg_lambda_rt" {
  vpc_id = "${aws_vpc.dxd_cep_app_stg_vpc.id}"

  tags = {
    Name = "${var.stg_lambda_rt}"
  }
}

resource "aws_route_table" "stg_db_rt" {
  vpc_id = "${aws_vpc.dxd_cep_app_stg_vpc.id}"

  tags = {
    Name = "${var.stg_db_rt}"
  }
}

### Subnets

resource "aws_subnet" "test_public1_2a_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_dmz_public_2a_sn"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "${var.test_public1_2a_sn}"
  }
}

resource "aws_subnet" "test_public2_2b_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_dmz_public_2b_sn"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.test_public2_2b_sn}"
  }
}

resource "aws_subnet" "test_public3_2c_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_dmz_public_2c_sn"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "${var.test_public3_2c_sn}"
  }
}


###

resource "aws_subnet" "stg_public1_2a_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_dmz_public_2a_sn"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "${var.stg_public1_2a_sn}"
  }
}

resource "aws_subnet" "stg_public2_2b_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_dmz_public_2b_sn"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.stg_public2_2b_sn}"
  }
}

resource "aws_subnet" "stg_public3_2c_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_dmz_public_2c_sn"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "${var.stg_public3_2c_sn}"
  }
}

### Lambda Sunbets

resource "aws_subnet" "test_private1_2a_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_lambda_private_2a_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "${var.test_private1_2a_sn}"
  }
}


resource "aws_subnet" "test_private2_2b_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_lambda_private_2b_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.test_private2_2b_sn}"
  }
}

resource "aws_subnet" "test_private3_2c_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_lambda_private_2c_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "${var.test_private3_2c_sn}"
  }
}

###

resource "aws_subnet" "stg_private1_2a_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_lambda_private_2a_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "${var.stg_private1_2a_sn}"
  }
}


resource "aws_subnet" "stg_private2_2b_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_lambda_private_2b_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.stg_private2_2b_sn}"
  }
}

resource "aws_subnet" "stg_private3_2c_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_lambda_private_2c_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "${var.stg_private3_2c_sn}"
  }
}


### DB Subnet

resource "aws_subnet" "test_private4_2a_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_db_private_2a_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "${var.test_private4_2a_sn}"
  }
}


resource "aws_subnet" "test_private5_2b_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_db_private_2b_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.test_private5_2b_sn}"
  }
}

resource "aws_subnet" "test_private6_2c_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_test_vpc.id}"
  cidr_block              = "${var.cep_test_subnet_cidrs["dxd_cep_app_test_db_private_2c_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "${var.test_private6_2c_sn}"
  }
}

###

resource "aws_subnet" "stg_private4_2a_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_db_private_2a_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "${var.stg_private4_2a_sn}"
  }
}


resource "aws_subnet" "stg_private5_2b_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_db_private_2b_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.stg_private5_2b_sn}"
  }
}

resource "aws_subnet" "stg_private6_2c_sn" {
  vpc_id                  = "${aws_vpc.dxd_cep_app_stg_vpc.id}"
  cidr_block              = "${var.cep_stg_subnet_cidrs["dxd_cep_app_stg_db_private_2c_sn"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "${var.stg_private6_2c_sn}"
  }
}


### Route tables



# Subnet Associations

resource "aws_route_table_association" "test_public1_assoc" {
  subnet_id      = "${aws_subnet.test_public1_2a_sn.id}"
  route_table_id = "${aws_route_table.test_dmz_rt.id}"
}

resource "aws_route_table_association" "test_public2_assoc" {
  subnet_id      = "${aws_subnet.test_public2_2b_sn.id}"
  route_table_id = "${aws_route_table.test_dmz_rt.id}"
}

resource "aws_route_table_association" "test_public3_assoc" {
  subnet_id      = "${aws_subnet.test_public3_2c_sn.id}"
  route_table_id = "${aws_route_table.test_dmz_rt.id}"
}

###
resource "aws_route_table_association" "stg_public1_assoc" {
  subnet_id      = "${aws_subnet.stg_public1_2a_sn.id}"
  route_table_id = "${aws_route_table.stg_dmz_rt.id}"
}

resource "aws_route_table_association" "stg_public2_assoc" {
  subnet_id      = "${aws_subnet.stg_public2_2b_sn.id}"
  route_table_id = "${aws_route_table.stg_dmz_rt.id}"
}

resource "aws_route_table_association" "stg_public3_assoc" {
  subnet_id      = "${aws_subnet.stg_public3_2c_sn.id}"
  route_table_id = "${aws_route_table.stg_dmz_rt.id}"
}


### Lambda

resource "aws_route_table_association" "test_lambda1_assoc" {
  subnet_id      = "${aws_subnet.test_private1_2a_sn.id}"
  route_table_id = "${aws_route_table.test_lambda_rt.id}"
}

resource "aws_route_table_association" "test_lambda2_assoc" {
  subnet_id      = "${aws_subnet.test_private2_2b_sn.id}"
  route_table_id = "${aws_route_table.test_lambda_rt.id}"
}

resource "aws_route_table_association" "test_lambda3_assoc" {
  subnet_id      = "${aws_subnet.test_private3_2c_sn.id}"
  route_table_id = "${aws_route_table.test_lambda_rt.id}"
}

###

resource "aws_route_table_association" "stg_lambda1_assoc" {
  subnet_id      = "${aws_subnet.stg_private1_2a_sn.id}"
  route_table_id = "${aws_route_table.stg_lambda_rt.id}"
}

resource "aws_route_table_association" "stg_lambda2_assoc" {
  subnet_id      = "${aws_subnet.stg_private2_2b_sn.id}"
  route_table_id = "${aws_route_table.stg_lambda_rt.id}"
}

resource "aws_route_table_association" "stg_lambda3_assoc" {
  subnet_id      = "${aws_subnet.stg_private3_2c_sn.id}"
  route_table_id = "${aws_route_table.stg_lambda_rt.id}"
}


###
resource "aws_route_table_association" "test_db1_assoc" {
  subnet_id      = "${aws_subnet.test_private4_2a_sn.id}"
  route_table_id = "${aws_route_table.test_db_rt.id}"
}

resource "aws_route_table_association" "test_db2_assoc" {
  subnet_id      = "${aws_subnet.test_private5_2b_sn.id}"
  route_table_id = "${aws_route_table.test_db_rt.id}"
}

resource "aws_route_table_association" "test_db3_assoc" {
  subnet_id      = "${aws_subnet.test_private6_2c_sn.id}"
  route_table_id = "${aws_route_table.test_db_rt.id}"
}

###

resource "aws_route_table_association" "stg_db1_assoc" {
  subnet_id      = "${aws_subnet.stg_private4_2a_sn.id}"
  route_table_id = "${aws_route_table.stg_db_rt.id}"
}

resource "aws_route_table_association" "stg_db2_assoc" {
  subnet_id      = "${aws_subnet.stg_private5_2b_sn.id}"
  route_table_id = "${aws_route_table.stg_db_rt.id}"
}

resource "aws_route_table_association" "stg_db3_assoc" {
  subnet_id      = "${aws_subnet.stg_private6_2c_sn.id}"
  route_table_id = "${aws_route_table.stg_db_rt.id}"
}
