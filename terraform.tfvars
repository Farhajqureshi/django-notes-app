# DEFINE ALL YOUR VARIABLES HERE

instance_type = "t2.medium"
ami           = "ami-0f918f7e67a3323f0"   # Ubuntu 24.04
key_name      = "windows-key-pair"                     # Replace with your key-name without .pem extension
volume_size   = 30
region_name   = "ap-south-1"
server_name   = "JENKINS-SERVER"

# Note: 
# a. First create a pem-key manually from the AWS console
# b. Copy it in the same directory as your terraform code