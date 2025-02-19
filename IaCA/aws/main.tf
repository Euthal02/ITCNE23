# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-08d772389fdc03e49"
resource "aws_security_group" "main" {
  description = "Standard Ports"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "mygroup"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-069c04ecc118f23eb"
  timeouts {
    create = null
    delete = null
  }
}

# __generated__ by Terraform
resource "aws_subnet" "main" {
  availability_zone                              = "us-east-1d"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  map_public_ip_on_launch                        = true
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags                                           = {}
  tags_all                                       = {}
  vpc_id                                         = "vpc-069c04ecc118f23eb"
  timeouts {
    create = null
    delete = null
  }
}

# __generated__ by Terraform
resource "aws_vpc" "main" {
  cidr_block                           = "172.31.0.0/16"
  enable_classiclink                   = false
  enable_classiclink_dns_support       = false
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  tags                                 = {}
  tags_all                             = {}
}

# __generated__ by Terraform from "i-0b862f1e6582ab3a1"
resource "aws_instance" "main" {
  ami                                  = "ami-053b0d53c279acc90"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1d"
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = null
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = null
  private_ip                           = "172.31.44.49"
  secondary_private_ips                = []
  security_groups                      = ["sg-08d772389fdc03e49"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0983da39b96d5109f"
  tags                                 = {}
  tags_all                             = {}
  tenancy                              = "default"
  user_data                            = "e6a7a95e24dc2149563b020589b358e214763716"
  user_data_base64                     = null
  volume_tags                          = null
  vpc_security_group_ids               = ["sg-08d772389fdc03e49"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    kms_key_id            = null
    tags                  = {}
    throughput            = 0
    volume_size           = 8
    volume_type           = "gp2"
  }
  timeouts {
    create = null
    delete = null
    update = null
  }
}
