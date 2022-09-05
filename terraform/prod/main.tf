module "key_pair" {
  source = "../modules/key_pair/"
  environment = "prd"
}

module "ec2" {
  source = "../modules/ec2"
    accountid = "097489095306"
    environment = "prd"
    vpc_cidr = "172.31.0.0/16"
    vpc_id = "vpc-e9067082"
    public_sub_1_id = "subnet-e5e6788e"
    public_sub_2_id = "subnet-4bfc2836"
    private_sub_1_id = "subnet-0ec74b9415fa02744"
    private_sub_2_id = "subnet-0b9b47f667ebd7397"
    acm-com = "0779793d-de30-4950-a956-c660aace4448"
    OIDC_PROVIDER = "https://oidc.eks.us-east-2.amazonaws.com/id/4A71AD7DEAE967627A2A55BA9EEC86C2"
    domain = "netamx.tech"
    idroute53 = "Z07830932DFHXD67734GW"
    region-efs-image = "us-east-2"
    deploymentaccount = "terraform-data"
    ssorole = "AWSReservedSSO_AWSAdministratorAccess_2c5d2e7ca1516fe4"
}
