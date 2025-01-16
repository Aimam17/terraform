variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The DynamoDB table for state locking (optional)"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "The Amazon Machine Image (AMI) ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}
