variable "cluster" {
  default = "web-app"
}
variable "app" {
  type        = string
  description = "Devops-app"
  default     = "webapp-101"
}
variable "zone" {
  default = "us-east1-d"
}
variable "docker-image" {
  type        = node
  description = "Hello world app"
  default     = "node:16:latest"
}