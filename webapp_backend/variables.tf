# To make naming easy, a context parameter is automatically injected into your template. 
# It contains metadata about the backing app/environment which you can use to generate unique and repeatable names.
# https://docs.radapp.io/guides/recipes/howto-author-recipes/#tabs-4-terraform
variable "context" {
  description = "Radius-provided object containing information about the resource calling the Recipe."
  type        = any
  default     = null
}

variable "create_storage_account" {
  description = "Whether to create a storage account or not."
  type        = bool
  default     = true
}

variable "create_redis_cache" {
  description = "Whether to create a Redis cache or not."
  type        = bool
  default     = false
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "westeurope"
}

variable "location_short" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "we"
}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "mydemo"
}

variable "stage" {
  description = "The stage (e.g. dev, test, prod, etc.) of the project."
  type        = string
  default     = "dev"
}
