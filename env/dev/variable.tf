variable "rg-dev" {
    type = map(object({
        rg_name = string
        location = string
        tags = optional(map(string))
    }))
}

variable "aks-dev" {}

variable "acr-dev" {}

variable "sql-dev" {}

variable "sqldb-dev" {}