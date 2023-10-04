provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}

resource "vault_aws_secret_backend" "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-1"

  default_lease_ttl_seconds = "1200"
  max_lease_ttl_seconds     = "3600"
}

resource "vault_aws_secret_backend_role" "ec2-admin" {
  backend         = vault_aws_secret_backend.aws.path
  name            = "ec2-admin-role"
  credential_type = "iam_user"

  policy_document = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:*", "ec2:*", "s3:*", "kms:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "vault_auth_backend" "aws" {
  type = "aws"
}


/*resource "vault_aws_auth_backend_sts_role" "role" {
  backend = vault_auth_backend.aws.path
  account_id = ""
  sts_role = arnnumber 
} */

