# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Configure the state
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
terraform {
  required_version = ">= 1.0.0"
}
# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------
provider "aws" {
  region = var.region
}
# ------------------------------------------------------------------------------
# DEPLOY THE WEBSERVER-CLUSTER MODULE
# ------------------------------------------------------------------------------
module "webserver_cluster" {
  source = "./modules/webserver-cluster"

  cluster_name  = var.cluster_name
  instance_type = var.instance_type
  min_size      = var.max_size
  max_size      = var.max_size
}
