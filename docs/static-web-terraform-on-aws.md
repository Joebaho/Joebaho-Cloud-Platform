# Static web site hosting on S3 using Terraform

## 🚀 Overview:
The Static web site project on AWS using Terraform aims to create a scalable and resilient web static site hosted on S3 which is an Amazon Web Services (AWS) cloud platform. This project utilizes Terraform, an Infrastructure as Code (IaC) tool, to provision and manage the S3 bucket with all the parameters that will make it publicly accessible. The goal of this project is to design and deploy a web site host on S3 that will include all neccessary copoments of the S3 bucket.


## 🔧 Problem Statement

Terraform is an IaC software tool that provides a consistent command line interface (CLI) workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files. In this specific case you need to create S3 bucket that will host a static web site. Terraform will use this deployment to provide all needed S3 elements that will make the web site to be accessible  avoiding us to use the console and it will automate the setup, ensuring consistency and reducing human error.

## 💽 Techonology Stack

 The architecture consists of the following three tiers:

- **S3**: AWS VPC


## 📌 Architecture Diagram

![alt text](assets/images/vpc-foundation-terraform-on-aws/Web App Reference Architecture (2).png)

## 🌟 Project Requirements

Before you get started, make sure you have the following prerequisites in place:

- [Terraform](https://www.terraform.io/) installed on your local machine.
- AWS IAM credentials configured in your text editor. In this case we will use VSCODE.
- Git installed on your local machine and Github account set up [Github](https://www.github.com)
- Git for cloning the repository.

You must also know Terraform workflow

![alt text](assets/images/terraform-workflow.jpg)

## 📋 Table of Contents

I - **Terraform Configuration files**
  
  [Step 1: Provider Configuration](#-Provider-configuration)

  [Step 2: S3 Configuration](#-VPC-configuration)

  [Step 4: Output Configuration](#-Output-configuration)

II - **Instructions of Deployment**

  [Step 1: Clone Repository](#-Clone-Repository)

  [Step 2: Initialize Folder](#-Initialize-Folder)

  [Step 3: Format Files](#-Format-Files)

  [Step 4: Validate Files](#-Validate-Files)

  [Step 5: Plan](#-Plan)

  [Step 6: Apply](#-Apply)

  [Step 7: Review of Resources](#-Review-Of-Resources)

  [Step 8: Destroy](#-Destroy) 
  
<br>

## ✨Terraform Configuration files 

<br>
You need to write different files generating resources
<br>


##### Step 1:  ***Provider Configuration***

Here we declare our cloud provider and we specify the region where we will be launching resources

- [provider Configuration](https://github.com/Joebaho/Joebaho-Cloud-Platform/blob/main/site/static-web-terraform-on-aws/providers.tf)


##### Step 3: ***S3 Configuration***

This is where you create the basement, foundation and networking where all the resources will be launch. It includes VPC, Subnets, IGW, NatGateway, EIP and Route tables

- [S3  Configuration](https://github.com/Joebaho/Joebaho-Cloud-Platform/blob/main/site/static-web-terraform-on-aws/main.tf)

We have here

- **Bucket name**: 
- **Permissions**: 
- **Objects**: 
- **Properties**: 

##### Step 4: ***Output Configuration***

Know as Output Value : it is a convenient way to get useful information about your infranstructure printed on the CLI. It is showing the ARN, name or ID of a resource. In this case we are bringing out the DNS name of the web application Load balancer.  

- [Output Configuration](https://github.com/Joebaho/Joebaho-Cloud-Platform/blob/main/site/static-web-terraform-on-aws/outputs.tf)

## 💼 Instructions of Deployment
<br>
Follow these steps to deploy the architecture:
<br>

##### Step 5: ***Clone Repository:***

<br>
Clone the repository in your local machine using the command "git clone" 
<br>
>
   git clone https://github.com/Joebaho/Joebaho-Cloud-Platform/tree/main/site/static-web-terraform-on-aws
   
<br>
##### Step 6: ***Initialize Folder***

<br>
Initialize the folder containing configuation files that were clone to Terraform and apply the configuration by typing  the following command
 <br> 
>
   terraform init
   
<br>
   You must see this image

   ![alt text](assets/images/static-web-terraform-on-aws/terraform-init.jpg)

##### Step 7: ***Format Files***
<br>
Apply any changes on files and Review the changes and confirm the good format with command:
   
>
   terraform fmt

 <br>  
##### Step 8: ***Validate Files***

<br>
Ensure that every files are syntactically valid and ready to go with the command: 
   
>
   terraform validate


   If everything is good you will have something like this 

  ![alt text](assets/images/static-web-terraform-on-aws/terraform-validate.jpg) 

##### Step 9: ***Plan***
<br>
Create an excution plan to provide the achievement of the desired state. It Check and confirm the numbers of resources that will be create. Use command:
   
>
   terraform plan

   
   The list of all resources in stage of creation will appear and you can see all properties(arguments and attributs) of each resouces

   ![alt text](assets/images/static-web-terraform-on-aws/terraform-plan1.jpg) 

   ![alt text](assets/images/static-web-terraform-on-aws/terraform-plan2.jpg) 

##### Step 10: ***Apply***

<br>
Bring all desired state resources on life. It Launch and create all resources listed in the configuration files. The command to perform the task is:  
   
>
   terraform apply -auto-approve


The process of creation will start and you will be able to see which resourse is on the way to be create and the time it taking to create.

At the end you will recieve a prompt message showing all resources status: created, changed and the numbers of them. 

   ![alt text](assets/images/static-web-terraform-on-aws/terraform-apply.jpg)  

##### Step 11: ***Review of resources***

<br>
Go back on the console and check all actual state resources one by one to see. You will have

  
- **S3**

   ![alt text](assets/images/static-web-terraform-on-aws/s3.jpg) 

   
- **Permissions**

   ![alt text](assets/images/static-web-terraform-on-aws/permissions.jpg) 

   
- **objects**

   ![alt text](assets/images/static-web-terraform-on-aws/objects.jpg) 


- **properties**

   ![alt text](assets/images/static-web-terraform-on-aws/properties.jpg)   


- **web page**


   ![alt text](assets/images/static-web-terraform-on-aws/web-index-page.jpg) 

  
- **error page**


   ![alt text](assets/images/static-web-terraform-on-aws/error-page.jpg) 


##### Step 12: ***Destroy*** <br>

<br>
Destroy the terraform managed infrastructure meaning all resourcescreated will be shut down. This action can be done with the command "terraform destroy" 
   
 >  
   terraform destroy -auto-approve
   
   

At the end you will recieve a prompt message showing all resources has been destroyed

   ![alt text](assets/images/static-web-terraform-on-aws/terraform-destroy.jpg)  


## 📄 License

This project is licensed under the Joebaho Cloud License
