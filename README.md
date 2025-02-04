# DevOps Project: MEAN Infrastructure on AWS with Terraform

## 📌 Description

This project was developed as part of the **DevOps** master's degree at the **International University of La Rioja (UNIR)** by team **2D**. Its objective is to create an infrastructure on AWS for deploying a **MEAN (MongoDB, Express, Angular, Node.js)** application using **Packer** and **Terraform** for process automation.

## 🛠 Technologies Used

- **Packer**: For creating custom **Amazon Machine Images (AMIs)** for frontend and database.
- **Terraform**: For provisioning infrastructure on AWS in a modular and reproducible manner.
- **AWS**: As cloud infrastructure provider.

## 📂 Repository Structure

```
/
│── packer-amis/               # Packer AMI Definitions
│   ├── mean-ami               # MEAN Application AMI
│   ├── mongodb-ami            # MongoDB Database AMI
│── terraform/                 # Terraform Infrastructure
├── main.tf                    # Template for the modules
├── variables.tf               # Global variables
├── outputs.tf                 # Global outputs
├── terraform.tfvars           # Variables values
├── modules/                   # Modules folder
│├── network/                  # Network module (VPC, subnets, Internet Gateway)
│   │   ├── main.tf            # Network module config
│   │   ├── variables.tf       # Network module variables
│   │   ├── outputs.tf         # Network module outputs (vpc_id, subnets, etc.)
│├── security/                 # Security module (Security groups)
│   │   ├── main.tf            # Security module config
│   │   ├── variables.tf       # Security module variables
│   │   ├── outputs.tf         # Security module outputs (sg_ids)
│├── instances/                # Instances module (Packer generated AMIs)
│   │   ├── main.tf            # Instances module config
│   │   ├── variables.tf       # Instances module variables
│   │   ├── outputs.tf         # Instances module outputs (instance_ids)
│ ├── load_balancer/           # Load balancer module
│   │   ├── main.tf            # Load balancer module config
│   │   ├── variables.tf       # Load balancer module variables
│   │   ├── outputs.tf         # Load balancer module outputs (ALB, listeners)

│── README.md                  # Project readme
│── docs                       # Project documentation
```

## 🔹 Prerequisites

Before deploying the infrastructure, ensure you have:

- An active **AWS** account.
- **Terraform** and **Packer** installed on your machine.
- AWS credentials configured with EC2 and VPC access (using `aws configure` or environment variables).
- Cloned this repository to your local machine:

```bash
git clone https://github.com/Lordbear117/mean-terraform-deployment-aws-unir-devops.git
cd mean-terraform-deployment-aws-unir-devops
```

## 🛠️ Configuration Customization

### 📋 Customizing Variables

Before deployment, you'll need to customize two critical configuration files:

#### 1. Terraform Variables (terraform.tfvars)

Edit the `terraform.tfvars` file to set your specific AWS and infrastructure variables:

```hcl
# Example variables (replace with your specific values)
region           = "us-west-2"
environment      = "development"
mongodb_ami_id   = "ami-xxxxxxxxxxxxxxxxx"
mean_app_ami_id  = "ami-yyyyyyyyyyyyyyyyy"
```

Key variables to modify:
- `region`: AWS region where resources will be deployed
- `ami_mongodb_id`: ID of the MongoDB AMI created with Packer
- `ami_mean_stack_id`: ID of the MEAN application AMI created with Packer

#### 2. EC2 Instance SSH Key Configuration

In the `mean-terraform-deployment-aws-unir-devops/instances/main.tf` file, update the SSH key path:

```hcl
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("path/to/your/private/key.pem")
  host        = self.public_ip
}
```

Replace `"path/to/your/private/key.pem"` with the absolute path to your SSH private key. For example:
- On Windows: `"C:\\Users\\YourUsername\\Downloads\\your-key-pair.pem"`
- On macOS/Linux: `"~/path/to/your/key-pair.pem"`

### 🔐 Key Considerations

- Ensure your SSH key has the correct permissions:
  - Windows: Right-click > Properties > Security > Advanced
  - macOS/Linux: `chmod 400 your-key-pair.pem`
- Never commit your private key to version control
- Use environment-specific keys for different deployments
- 
## 🚀 Infrastructure Deployment Instructions

### 1️⃣ Create AMIs with Packer

```bash
cd packer-amis
cd mean-ami
cd mongodb-ami
packer init .
packer build packer.pkr.hcl
```

This will generate two custom **AMIs** in AWS.
Repository used for the AMIs: https://github.com/Lordbear117/mean-stack-example

### 2️⃣ Deploy Infrastructure with Terraform

```bash
cd mean-terraform-deployment-aws-unir-devops
terraform init
terraform apply -auto-approve
```

Terraform will create the complete infrastructure in AWS, including:
- VPC and subnets.
- Security groups.
- EC2 instances with created AMIs.
- Load balancer.

## 📌 Additional Relevant Sections

### 🌎 Security Considerations

- It is recommended to restrict SSH access to secure IPs only.
- MongoDB is configured to accept connections only within the VPC.

### 🛑 How to Destroy Infrastructure

To remove all created resources and avoid unnecessary costs in AWS:

```bash
cd mean-terraform-deployment-aws-unir-devops
terraform destroy -auto-approve
```

## 📢 Contributions

If you wish to improve this project, you can open a **pull request** or report an **issue** in the repository.

**Team 2D - UNIR** | DevOps Master's Degree 🚀