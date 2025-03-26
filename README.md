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
├── terraform.tfvars     # Variable values (optional, non-sensitive)
├── .gitignore           # Ignore transient files
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

#### 