# =================
# VPC
# =================

#   Arguments:
#   - Resource: "aws_vpc" (Whats going to be deployed)
#   - Name: "mtc_vpc" (Internal name for the resource inside of terraform. Doesnt show up in AWS)
resource "aws_vpc" "mtc_vpc" {
    cidr_block = "10.123.0.0/16"

    # Enable DNS hostnames (Disabled by default)
    enable_dns_hostnames = true

    # Enable DNS support 
    # (Enabled by default. Included to be explicit about the VPC defaults)
    enable_dns_support = true

    # Name the VPC
    tags = {
        Name = "dev"
    }
}

# =================
# SUBNET
# =================

resource "aws_subnet" "mtc_public_subnet" {

    # We add the VPC ID from the previously created VPC. The ID can be
    # retrieved by referencing the type of resource, followed by the name
    # of the resource and finally the field that you want. In this case
    # "aws_vpc.mtc_vpc" is a reference to the actual object, so no need to
    # convert the "id" to a string or something similar.
    vpc_id = aws_vpc.mtc_vpc.id

    # CIDR must be within the range specified by the CIDR block in the VPC
    cidr_block = "10.123.1.0/24"

    # Assign a public IP on creation
    map_public_ip_on_launch = true

    # We use us-west-2a cause thats a common setup, but you can actually use
    # something called "data sources" to ensure that this is always correct
    availability_zone = "us-east-1a"

    # Name the resource
    tags = {
        Name = "dev-public"
    }
}

# =================
# INTERNET GATEWAY
# =================
# Give access to our instances through the internet.

resource "aws_internet_gateway" "mtc_internet_gateway" {
    
    # Add the VPC ID like before
    vpc_id = aws_vpc.mtc_vpc.id

    # Name the resource
    tags = {
        Name = "dev-igw"
    }
}

# =================
# ROUTE TABLE AND ROUTES
# =================
# Route traffic from our subnet to our internet gateway

# Route Table
resource "aws_route_table" "mtc_public_rt" {
    vpc_id = aws_vpc.mtc_vpc.id

    # Name the resource
    tags = {
        Name = "dev_public_rt"
    }
}

# Route
resource "aws_route" "default_route" {
    route_table_id = aws_route_table.mtc_public_rt.id

    # All IP addresses will head to the previously created internet gateway
    destination_cidr_block = "0.0.0.0/0"

    # Set the internet gateway ID where the traffic will be headed to
    gateway_id = aws_internet_gateway.mtc_internet_gateway.id
}

# Bridge the gap between our route table and our subnet by creating a 
# route-table association.
resource "aws_route_table_association" "mtc_public_association" {
    subnet_id = aws_subnet.mtc_public_subnet.id
    route_table_id = aws_route_table.mtc_public_rt.id
}

# =================
# SECURITY GROUP
# =================
# Restrict the IPs that can access to the VPC or the IPs accesible from the inside

resource "aws_security_group" "mtc_sg" {
    
    # Theres no point in actually having a tag here because the
    # resource actually has a name attribute. You can add a tag
    # but it wont really make a difference.
    name = "dev_sg"
    description = "Dev security group"

    # VPC relationship
    vpc_id = aws_vpc.mtc_vpc.id

    # Ingress Rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["190.104.120.9/32"]      # Only allow access from my address
    }

    # Egress Rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]             # All the internet is accessible from the inside
    }
}

# =================
# KEY PAIR
# =================
# A key pair will be created and then a resource will be created that utilizes this key pair.
# This will be used by the EC2 instance resource we will create so that we can SSH into it

resource "aws_key_pair" "mtc_auth" {
    key_name = "mtc_key"

    # Created using the command: "ssh-keygen -t ed25519"
    # The key was named "mtc_key" and was left with no passphrase
    public_key = file("~/.ssh/mtc_key.pub")
}


# =================
# EC2 INSTANCE
# =================

resource "aws_instance" "dev_node" {

    # Instance size (t2, t3, ...)
    instance_type = "t2.micro"

    # Image to use for the OS of the instance 
    # (See the names used in the datasource for the AWS 
    #  AMI inside the datasources.tf file)
    # 
    #   ami = data.data_source.data_name
    # 
    ami = data.aws_ami.server_ami.id

    # Use the previously created keypair
    # (You can also use the keypair ID here and it will work)
    key_name = aws_key_pair.mtc_auth.key_name

    # Give the instance a security group
    # (Multiple can be provided)
    vpc_security_group_ids = [aws_security_group.mtc_sg.id]

    # Add the instance to a subnet
    subnet_id = aws_subnet.mtc_public_subnet.id

    # User data is going to be used to bootstrap our instance and install
    # the docker engine. This will allow us to have an instance with docker
    # already installed when booted.
    # (To boostrap = Execute a program on load to setup the computer)
    user_data = templatefile("userdata.tpl", {})

    # Increase the size of the disc used by the instance
    # (By default the t2.micro gives you a volume size of 8)
    root_block_device {
        volume_size = 10
    }

    # Name the instance
    tags = {
        Name = "dev-node"
    }

    # Provisioner
    # Adds the host information of the instance to your local configuration
    # so that you are able to connect to the instance through the SSH extension
    # in VSCode.
    provisioner "local-exec" {
        
        # Feed the template all the required variables
        # (NOTE: You can use the self keyword to get the values from the parent
        #  resource that contains the provisioner)
        command = templatefile("${var.host_os}-ssh-config.tpl", {
            hostname = self.public_ip,
            user = "ubuntu",

            # Path to private ssh key to our instance
            identityfile = "~/.ssh/mtckey"
        })

        # Interpreter: Tells the provisioner what it needs to use to 
        # interpret our script (Defaults to bash). In this case, since
        # we are on windows we use the following (each part of a command
        # is a list element)
        interpreter = ["Powershell", "-Command"]

        # For linux
        # interpreter = ["bash", "-c"]
    }

}
