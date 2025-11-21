variable "rg-name" {
  type    = string
  default = "pranav-aks-rg"
}

variable "rg-location" {
  type    = list(string)
  default = ["eastus", "centralus", "centralindia", "westus"]
  #             0            1            2             3
}

variable "pip-name" {
  type    = string
  default = "new-pip"
}

variable "ssh-port" {
  type    = number
  default = 22
}

variable "http-port" {
  type    = number
  default = 80
}

variable "rdp-port" {
  type    = number
  default = 3389
}

variable "size" {
  type = map(string)
  default = {
    "dev"  = "Standard_F2"
    "test" = "Standard_B1s"
    "prod" = "Standard_D2s_v3"
  }
}

variable "is_prod" {
  type    = bool
  default = true
}

variable "vms" {
  type = map(object({
    name = string
    size = string
  }))
  default = {
    "vm1" = {
      name = "linux-machine-web"
      size = "Standard_D2s_v3"
    }
    "vm2" = {
      name = "linux-machine-db"
      size = "Standard_D2s_v3"
    }
    "vm3" = {
      name = "linux-machine-backend"
      size = "Standard_D2s_v3"
    }
  }
}


variable "security_rule" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string

  }))
  default = [{
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },
    {
      name                       = "allow-http"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "allow-rpd"
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "allow-https"
      priority                   = 103
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }]
}


variable "subscription_id" {} 
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
