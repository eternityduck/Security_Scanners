variable "password" {
  description = "The root password for our VM"
  type        = string
}

resource "evil_corp" "good_example" {
	root_password = var.password
}

output "jenkins_terraform" {
  value = "running Terraform from Jenkins"
}
