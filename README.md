<<<<<<< HEAD

# 🚀 Project Overview: jenkins-terra-infra

 This Terraform-based infrastructure project automates the provisioning of a complete Jenkins deployment on AWS, designed with modularity, scalability, and reusability in mind. It leverages Terraform modules to manage cloud components individually — enabling clean separation of concerns and easier maintenance.

jenkins-terra-infra/
├── backend.tf
├── main.tf
├── provider.tf
├── terraform.tfvars
├── variables.tf
├── README.md
└── modules/
    ├── jenkins_instance/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── networking/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── securtiy-groups/   
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── load-balancer/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── load-balancer-target group/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf

## 🧱 Architecture Breakdown

#Core Files:

main.tf: Entry point that wires together all modules.
provider.tf: AWS provider configuration.
backend.tf: Configures remote state storage.
variables.tf & terraform.tfvars: Parameterize deployment and allow environment-specific values.

# Modules Directory:

networking/: Provisions VPC, subnets, and internet gateways.

security_group/: Defines security rules for Jenkins, SSH, and load balancers.

jenkins_instance/: Launches EC2 instance with Jenkins pre-installed via cloud-init or user data.

load-balancer/: Manages ALB/NLB setup to route traffic to Jenkins.

load_balancer_target_group/: Handles registration of Jenkins instance into target groups for load balancing.

# 🌟 Features & Benefits

🔐 Secure Jenkins access via custom security groups.

⚙️ Modular design makes it easy to swap resources (e.g., different AMIs or instance types).

☁️ Supports high availability when scaling with load balancers and multiple subnets.

🧩 Easily integrates with GitHub Actions, Jenkins agents, or Terraform Cloud.
