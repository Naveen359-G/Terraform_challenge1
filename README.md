# Terraform_challenge1:
#Task: is from KodeKloud Terraform Challenge.

In this challenge we will implement a simple LAMP stack using terraform and docker.
Utilize /root/code/terraform-challenges/challenge2 directory to store your Terraform configuration files.
------------------------------------------------------------------------------------------------------------------------
# Install terraform binary version=1.1.5 on iac-server
- Docker provider has already been configured using kreuzwerker/docker provider.
------------------------------------------------------------------------------------------------------------------------
Check out the provider.tf given at /root/code/terraform-challenges/challenge2

- Create a terraform resource named php-httpd-image for building docker image with following specifications:
Image name: php-httpd:challenge
Build context: lamp_stack/php_httpd
Labels: challenge: second

- Create a terraform resource named mariadb-image for building docker image with following specifications:
Image name: mariadb:challenge
Build context: lamp_stack/custom_db
Labels: challenge: second

-Create a terraform resource named private_network and configure the following:
Create a Docker network with name=my_network
Enable manual container attachment to the network.
User-defined key/value metadata: challenge: second

-Define a terraform resource php-httpd for creating docker container with following specification:
Container Name: webserver
Hostname: php-httpd
Image used: php-httpd:challenge
Attach the container to network my_network
------------------------------------------------------------------------------------------------------------------------
Publish a container's port(s) to the host:
Hostport: 0.0.0.0:80
containerPort: 80
Labels: challenge: second
Create a volume with host_path /root/code/terraform-challenges/challenge2/lamp_stack/website_content/ 
and container_path /var/www/html within webserver container.

- Define a terraform resource phpmyadmin for docker container with following configurations:
Container Name: db_dashboard
Image Used: phpmyadmin/phpmyadmin
Hostname: phpmyadmin

Attach the container to network my_network
Publish a container's port(s) to the host:
Hostport: 0.0.0.0:8081
containerPort: 80
Labels: challenge: second
------------------------------------------------------------------------------------------------------------------------
Establish link based connectivity between db and db_dashboard containers (Deprecated)
Explicitly specify a dependency on mariadb terraform resource
- Define a terraform resource mariadb for creating docker container with following specification:
Container Name: db
Image Used: mariadb:challenge
Hostname: db
Attach the container to network my_network
------------------------------------------------------------------------------------------------------------------------
Publish a container's port(s) to the host:
Hostport: 0.0.0.0:3306
containerPort: 3306
Labels: challenge: second
------------------------------------------------------------------------------------------------------------------------
Define environment variables inside mariadb resource:
MYSQL_ROOT_PASSWORD=1234
MYSQL_DATABASE=simple-website
Attach volume mariadb-volume to /var/lib/mysql directory within db container.

-Create a terraform resource named mariadb_volume creating a docker volume with name=mariadb-volume
 
=========================================================================================================================

# Steps to the Solution:
# Step 1: Setup Environment
Connect to the iac-server where you will be running Terraform.

# Step 2: Install terraform
```JSON
wget https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
unzip terraform_1.1.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```
Verify the installation:
```JSON
terraform --version
```
Navigate to the directory /root/code/terraform-challenges/challenge2 where you'll be working on this task.

```JSON
cd /root/code/terraform-challenges/challenge2
```
# Step 3: Create Terraform Configuration Files
Create the following Terraform configuration files: (Check the repository for terraform code)
- php-httpd-image.tf
- mariadb-image.tf
- private-network.tf
- php-httpd.tf
- phpmyadmin.tf
- mariadb.tf
- mariadb_volume.tf

Use a text editor like vi or nano to create and edit these files.

# Step 4: Write Terraform Configuration
Write Terraform configuration code according to the task requirements in each of the .tf files.
Ensure you follow the specifications provided in the task for each resource and correctly define the necessary attributes.
Make sure to save the changes after editing each file.

# Step 5: Initialize Terraform
Initialize Terraform in the directory containing your configuration files:

```JSON
terraform init
```

# Step 6: Plan Terraform Deployment
Generate and review an execution plan to see what Terraform will do before making any changes:

```JSON
terraform plan
```

# Step 7: Apply Terraform Configuration
Apply the Terraform configuration to create the Docker resources:

```JSON
terraform apply
```
- Confirm the action by typing yes when prompted.

# Step 8: Verify Docker Containers
Use the docker ps command to verify that the Docker containers (webserver, db, db_dashboard) are running:
```JSON
docker ps
```

Step 9: Clean Up (Optional)
If needed, you can clean up resources by destroying the Terraform-managed infrastructure:

```JSON
terraform destroy
```

# Once you're finished with your tasks, you can exit the environment or disconnect from the server.
