### Commands

- `terraform init`: Start a new terraform project, and download the required terraform binary
- `terraform plan`: Shows what you are going to be building.
- `terraform apply`: Apply the changes displayed when you do `terraform plan`
- `terraform state list`: See a list of all the operations done inside the current terraform project.
- `terraform state show type_of_resource.name_of_resource`: See the information related to the different changes that you created in a specific state. This state can be outputted to JSON and be manipulated. It can also be used to check the state of variables being used inside of the terraform script.
- `terraform show`: Show ALL of the changes made (The info for all states).
- `terraform destroy`: Destroy anything that we have created (Also can be invoked using `terraform apply -destroy`). Use `terraform destroy -auto-approve` to not display a dialog asking for confirmation.
- `terraform fmt`: Correct any inconsistencies found in the `.tf` files.

### State

- When you do a terraform operation, all the processed changes get placed inside a tfstate file. The information is almost the same as the one that you can get from the AWS extension, as both use the AWS API.
- Datasource: A data source is basically just a query of the AWS API, to receive info we need to deploy a resource. In this case, we need an AMI datasource, which will allow us to get an AMI ID (AMI = Amazon Machine Images. Basically the type of instance that will be deployed).

### Access the Instance

- Get the public IP by using terraform show: `terraform state show aws_instance.dev_node`
- SSH into the instance: `ssh -i ~/.ssh/mtc_key ubuntu@public_ip`

### Connection to Instance from VSCode

We are going to use the SSH extension in VSCode to connect to the remote instance. To allow the connection we need to add an entry to the local "config" file inside of the ".ssh" folder. The entry should look like this:

Host ip_of_instance
    HostName ip_of_instance
    User instance_user

In this case:

- instance_user = ubuntu
- ip_of_instance = Can be obtained using terraform

### Reloading Provisioner

After changing the provisioner, you will notice that when you run `terraform plan`, no changes will be generated or registered, meaning that when you run `terraform apply`, no changes will be applied to your infrastructure. This is because a provisioner doesn't actually change anything in the terraform state. To reload the changes you need to do:

```bash
terraform apply -replace aws_instance.dev_node
```

This applies any changes and forces terraform to regenerate the state for our `aws_instance`.
