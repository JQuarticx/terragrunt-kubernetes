#### aws eks resource provisioning use terraform with help of terragrunt

Requirments

    1. aws credentials
    2. terraform
    3. terragrunt
    4. s3 bucket


commands

    cd resource-provision


modified the below parameters  in terragrunt.hcl

    1. region
    2. backend configuration
    3. input 


    terragrunt init
    terragrunt plan
    terragrunt apply
    terragrunt show
    terragrunt destroy
