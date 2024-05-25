## Aws/K8s
### Overview
This project aims to create an Amazon EKS (Elastic Kubernetes Service) cluster with specific configurations using Terraform. The main goals of this project include setting up an EKS cluster with a single node pool, installing the Keda addon for autoscaling, connecting it to an AWS SQS (Simple Queue Service), and scaling up based on the SQS queue events.

### Technologies Used
AWS (Amazon Web Services)
Kubernetes (K8s)
Terraform
### Project Goals
The primary goal of this project is to deploy an EKS cluster with specific requirements:

Create a Standard VPC with 4 Availability Zones: Set up a VPC (Virtual Private Cloud) infrastructure with four availability zones to ensure high availability and fault tolerance.

Create an EKS Cluster with 1 Node Pool: Deploy an EKS cluster with one node pool that contains two EC2 instances. Ensure that the EC2 instances are created within private subnets to enhance security.

Install Keda Addon on the Cluster: Utilize the Keda (Kubernetes-based Event-Driven Autoscaler) addon for autoscaling deployments. Follow the instructions provided at Keda Addon Installation to install Keda on the EKS cluster.

Create Nginx Deployment: Deploy an Nginx web server as a Kubernetes deployment. Establish a connection between Keda and an AWS SQS queue and associate it with the Nginx deployment.

Scale Up Deployment Based on SQS Events: Configure Keda to monitor an AWS SQS queue. When the queue receives more than 10 events, ensure that the Nginx deployment scales up accordingly.

Use Terraform: Ensure that all infrastructure components and configurations are created using Terraform or Terragrunt for infrastructure as code.

### Usage
#### Follow the steps below to deploy the project:

Clone the repository.
Navigate to the project directory.
Modify the Terraform configuration files to match your AWS credentials and desired configurations.
Run terraform init to initialize the project.
Run terraform apply to apply the changes and deploy the infrastructure.
