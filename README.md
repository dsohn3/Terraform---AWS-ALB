# Terraform—AWS-ALB
A demonstration of how to setup two EC2 instances with Apache HTTP Servers managed by an ALB in AWS’ Default VPC setup

# Infrastructure Summary
- EC2 Instances (2)
- Security Group
- ALB w/ HTTP listener
- AWS Default VPC (Six Subnets, Route Table, and NACL)

# Launch Steps
1. After launching this configuration in the terminal, it will output the DNS of the ALB.  Access the URL which will either say, ‘Deployed via Terraform 1’ or ‘Deployed via Terraform 2’ depending on which instance is being used.  Click ‘Refresh’ to visually see the ALB at work.

