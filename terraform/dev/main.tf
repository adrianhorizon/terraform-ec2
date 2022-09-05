module "key_pair" {
  source = "../modules/key_pair/"
  environment = "dev"
}

module "eks" {
  source = "../modules/eks"
    accountid = "924372076016"
    environment = "dev"
    vpc_cidr = "172.35.0.0/16"
    vpc_id = "vpc-0dd32ae47848f1302"
    public_sub_1_id = "subnet-04371feef962b9856"
    public_sub_2_id = "subnet-0b4579393e5a1af11"
    private_sub_1_id = "subnet-0f31f47d7835df143"
    private_sub_2_id = "subnet-0ccf3914adc81b71d"
    acm-com = "d8eb820e-23ac-431a-8927-ae5a2aac6e3c"
    OIDC_PROVIDER = "https://oidc.eks.us-east-1.amazonaws.com/id/95DE26CD1FF673A675DEA0C95827A5D0"
    domain = "neta-dev.mx"
    idroute53 = "Z07289962IVFKDEK0O0HU"
    region-efs-image = "us-east-1"
    deploymentaccount = "terraform-data"
    ssorole = "AWSReservedSSO_AWSAdministratorAccess_c9132a693c749ba3"
}
