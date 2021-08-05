variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription ID"
  default = "61b5c3d4-63f9-4df5-8d52-9637ca088141"
}

variable "azure-client-id" {
  type        = string
  description = "Azure Client ID"
  default = "f49a1713-4788-4fe4-9590-2650d444b387"
}

variable "azure-client-secret" {
  type        = string
  description = "Azure Client Secret"
  default = "I8XN_.YWupG3~E.k9m8_9bnD00Fv0MkQEG"
}

variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant ID"
  default = "865f3fef-b96b-4b1d-a7b6-0b4b3fcfc87e"
}

variable "environment" {
  type        = string
  description = "Azure Tenant ID"
  default = "public"
}

variable "rgforvnet" {
  type    = string
  default = "vs-fewdtest-eastus2-rg"
}

variable "rg" {
  type    = string
  default = "vs-fewdtest-wwwstatic-eastus2-rg"
}
variable "location" {
  type    = string
  default = "East US 2"
}
variable "vnet" {
  type    = string
  default = "vs-fewdtest-eastus2-vnet-1"
}
#variable "resource_group" {
 # type    = string
 # default = "vs-fewdtest-eastus2-rg"
#}
variable "subnetname" {
  type    = string
  default = "fewdtest-vmpool-10.3.34.64_26"
}
variable "lbname" {
  type    = string
  default = "vs-fewdtest-ngx-lb"
}
variable "backendpool" {
  type    = string
  default = "wwwnginxtest"
}
