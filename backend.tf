terraform {
  backend "s3" {
    bucket = "satyam-new"
    key    = "satyam-resources.tfstate"
    region = "ap-south-1"
  }
}