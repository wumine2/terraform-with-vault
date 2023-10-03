variable "vault_addr" {
  default = "http://127.0.0.1:8200"
}

variable "vault_token" {
  default = "hvs.YmhR1eSiKtsfpqsVcTVMtYZD"
}

variable "region" {
  default = "us-east-1"
}

variable "cidr_vpc" {
  description = "CIDR block for the vpc"
  default     = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}

variable "availability_zone" {
  description = "availability zone to create subnet"
  default     = "us-east-1a"
}

variable "public_key_path" {
  description = "public_key path"  
  default     = "./vaultkey.pub"
}

variable "instance_ami" {
  description = "AMI for the aws EC2 instance"
  default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "type of aws EC2 instance"
  default     = "t2.micro"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "Prod"
}