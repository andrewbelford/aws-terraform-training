terraform {
  backend "remote" {
    organization = "abelford"
    workspaces {
      name = "abworkspace"
    }
  }
}
