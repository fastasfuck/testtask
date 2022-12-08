# recrd/terraform/review

This project contains some legacy Terraform code. Your task is to code review it.

Point out at least 5 issues in the code base and explain how would you fix it.


Varialbes.tf

Need to moved all variables that uses to this files

Providers.tf

Strange version of aws provider
Need added terraform required_version, and default tags to automatecly creation tags on resource that are creating by terraform

Manin.tf

Should be named route53.tf to be easy look through the Code

lambda.tf

Public password shouldn't be here. If we want add password with safty we should use local vars

Role of lambda using too many privileges

backets.tf

Have strange naming of resources
Variable shouldn't be here
Data shouldn't be here

modules
shouldn't be used provider here

Should also be formatted code by fmt
