
# Configures terraform to use the desired provider
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

# Provider block
# Provides the information to access AWS specifically
# (Credentials can also be provided through other methods, but this method
# uses the already existing credentials file)
provider "aws" {
    region                  = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"

    # This one is the name between brackets present inside credentials file
    # (If there's none, add it. eg. "[eddysanoli_admin]")
    profile                 = "eddysanoli_admin"
}

# NOTE: All files in the same directory are going to be processed as if they were the same
# file. This means that, for example, if we have 3 different .tf files, terraform will
# consider all of them as a single file. Files in terraform are more a way of organization
# than an actual functional requirement.