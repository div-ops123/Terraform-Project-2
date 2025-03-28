### Project Overview: Furniture Store Website on AWS
**Disclaimer**: Inspired by Author: Ryan Almeida
📌 GitHub Profile: Ryan Almeida[https://github.com/ryan-almeida]

📌 Medium Article: Learn 12 Terraform Concepts with a Hands-On Project[https://medium.com/@ryanralmeida/learn-12-terraform-concepts-with-a-hands-on-project-b47f04392289]

**Goal**: Provision a sample furniture store website hosted on EC2 instances, fronted by an Application Load Balancer (ALB), managed by an Auto Scaling Group (ASG) with a min of 2 and max of 4 instances, using Terraform modules for networking and compute, and remote state in S3/DynamoDB.

**Components**:
- **Networking**: VPC, subnets, security groups, ALB.
- **Compute**: EC2 instances, ASG, launch template.
- **State**: S3 bucket and DynamoDB table for Terraform state.

---

### Project Structure
Following best practices:

```
furniture-store-website/
├── main.tf              # Root module: Calls networking and compute modules
├── variables.tf         # Root-level input variables
├── outputs.tf           # Root-level outputs (e.g., ALB DNS name)
├── provider.tf          # AWS provider configuration
├── versions.tf          # Terraform and provider version constraints
├── terraform.tfvars     # Variable values for convenience (optional, non-sensitive)
├── .gitignore           # Ignore transient files
├── bootstrap/           # Directory to provision the remote state resources
│   ├── main.tf          # Create the S3 bucket and DynamoDB table
├── modules/
│   ├── networking/      # Module for VPC, subnets, ALB, etc.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   └── compute/         # Module for EC2, ASG, launch template
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
```

#### Prerequisites

### aws, aws cli, and terraform installed and set up

#### Deployment Guide

## 1. Configuring Remote State Management with S3 and DynamoDB

**Run the Bootstrap**:
1. Navigate to the `bootstrap/` directory:
   ```bash
   cd bootstrap
   ```
2. Initialize and apply:
   ```bash
   terraform init
   terraform apply
   ```
   - Type `yes` when prompted to create the resources.
3. This creates the S3 bucket and DynamoDB table, storing the state locally in `bootstrap/terraform.tfstate`.

**Initialize the Remote Backend**:
1. Navigate to your main project directory

2. Run:
   ```bash
   terraform init
   ```
   - Terraform will detect the backend configuration and prompt you to migrate any existing local state to S3. Type `yes`.

### Why This Works
- The bootstrap step creates the S3 bucket and DynamoDB table independently.
- The main project then uses these resources to store its state remotely, with DynamoDB providing state locking to prevent concurrent modifications.

---
dd
---


### My Workflow
1. **Bootstrap Remote State**:
   - Manually create an S3 bucket (e.g., `furniture-store-tf-state`) and DynamoDB table (e.g., `tf-locks`).
   - Add the backend config in `versions.tf`.

2. **Build Networking Module**:
   - Start with the VPC and subnets, test with `terraform apply`, then add ALB.

3. **Build Compute Module**:
   - Create the launch template and ASG, connect to the ALB target group.

4. **Tie It Together**:
   - Call both modules in `main.tf`, pass outputs from networking to compute.

5. **Test**:
   - Run `terraform plan` to preview, then `terraform apply`.
   - Access the ALB DNS name to see your website.

---