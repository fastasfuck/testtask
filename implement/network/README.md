# recrd/terraform/network

To be able to host our services in a multi-AZ AWS infrastructure we need a new VPC with 3 public subnets for our internet-facing load balancers and 3 private subnets for our EC2 instances.
For the EC2 instances in the private subnets we want to provide internet access using AWS NAT gateways.

This project is intended to configure one of such environments. Please configure these resources and necessary dependencies in a way that we can reuse it to configure additional `dev`, `test`, `uat`, etc. environments with minimal code duplication.

---

The project is configured to be able to test it using Community Edition [localstack][]. You can use it to validate your solution.

[localstack]: https://localstack.cloud/
