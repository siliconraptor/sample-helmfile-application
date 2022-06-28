remote_state {
  backend = "local"
  config {
    path = "/tmp/terraform.tfstate"
  }
}

terraform {
  source = "git::https://github.com/workwithprashant/devopsauto-argo.git?ref=main"
}

# Fill in the variables for that module
inputs = {
  argo_server: "grpc.argocd.sre.dell-tools.net:443"
  argo_server_token: get_env("DEVOPS_ARGOCD_API_KEY", "")
  argo_server_namespace: "ci-sre"
  git_username: get_env("GH_USER", "")
  git_password: get_env("GH_TOKEN", "")
  git_repository: "https://github.com/siliconraptor/sample-helmfile-application.git"
  git_branch: get_env("APP_TAG", "main")
  argo_project: "sample-microservice"
  destination_k8s_namespace: "default"
  project_description: "sample service"
  application_name: "sample-service"
  app_helmfile_env_name: get_env("ARGO_APPLICATION_ENV", "")
  app_helmfile_env_project: "sample-service"
}