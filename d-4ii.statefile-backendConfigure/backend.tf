terraform {
    backend "s3" {
        bucket = "statefile-configure-buc"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-state-lock-dynamo"
        encrypt = true
      
    }
  
}