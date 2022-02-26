terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}



#
# Variables - AWS API key
#

variable "aws_access_key" {
  type = string
  description = "AWS Access Key ID"
}

variable "aws_secret_key" {
  type = string
  description = "AWS Secret Key"
}



#
# Variables - pick specific AWS Region
#

variable "aws_region" {
  type = string
  description = "AWS Region"
}



#
# Variables - for cloud resources name prefix to avoid collision
#

variable "aws_account_id" {
  type = string
  description = "The AWS Account ID"
}

variable "infra_name" {
  type = string
  description = "Your infra name, ie. myinfra"
}



#
# Variables - managerial purpose
#

variable "admin_name" {
  type = string
}

variable "admin_email" {
  type = string
}

variable "purpose" {
  type = string
}



#
# Variables - specific for this Android CI/CD pipeline
#

variable "github_organization" {
  type = string
}

variable "github_repository" {
  type = string
}

variable "git_branch_name" {
  type = string
}

variable "git_clone_depth" {
  type = number
}

variable "compute_type" {
  type = string
}

variable "image" {
  type = string
}

variable "build_timeout" {
  type = string
}
