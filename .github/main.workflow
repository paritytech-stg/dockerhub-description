workflow "Update Docker Hub Description" {
  resolves = ["Docker Hub Description"]
  on = "push"
}

action "Filter master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Docker Hub Description" {
  needs = ["Filter master branch"]
  uses = "./"
  secrets = ["DOCKERHUB_USERNAME", "DOCKERHUB_PASSWORD", "DOCKERHUB_REPOSITORY"]
}