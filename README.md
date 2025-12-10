# AWS EC2 Terraform Test Project

This is a simple Terraform project to test creating AWS resources, specifically an EC2 instance.

## Prerequisites

1. **Terraform installed**: Download from [terraform.io](https://www.terraform.io/downloads)
2. **AWS CLI configured**: Run `aws configure` to set up your credentials
3. **AWS Account**: You need an active AWS account with appropriate permissions

## Setup

1. **Configure AWS credentials** (if not already done):
   ```bash
   aws configure
   ```
   You'll need:
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default region (e.g., `us-east-1`)
   - Default output format (e.g., `json`)

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Review the plan**:
   ```bash
   terraform plan
   ```

4. **Apply the configuration**:
   ```bash
   terraform apply
   ```
   Type `yes` when prompted to confirm.

## Configuration

You can customize the deployment by creating a `terraform.tfvars` file:

```hcl
aws_region     = "us-west-2"
instance_type  = "t3.micro"
instance_name  = "my-test-instance"
```

Or override variables via command line:
```bash
terraform apply -var="instance_type=t3.small" -var="aws_region=us-west-2"
```

## Outputs

After applying, Terraform will display:
- Instance ID
- Public IP address
- Public DNS name
- Private IP address
- SSH command (if you have SSH keys set up)

To view outputs later:
```bash
terraform output
```

## Cleanup

To destroy all created resources:
```bash
terraform destroy
```

## Notes

- This creates a security group that allows SSH (port 22) from anywhere (0.0.0.0/0). In production, restrict this to your IP.
- The instance uses the default VPC and a default subnet.
- The AMI used is the latest Amazon Linux 2023.
- Default instance type is `t2.micro` (free tier eligible in most regions).

## Troubleshooting

- **Authentication errors**: Make sure your AWS credentials are configured correctly
- **Permission errors**: Ensure your AWS user/role has permissions to create EC2 instances, VPCs, and security groups
- **Region issues**: Make sure the specified region is available in your AWS account

