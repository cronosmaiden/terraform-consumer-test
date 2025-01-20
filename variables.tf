############################
# Variables globales
############################

variable "region" {
  description = "Región de AWS para desplegar los recursos."
  type        = string
  default     = "us-east-1"
}

############################
# Variables de Lambda
############################

variable "lambda_function_name" {
  description = "Nombre de la función Lambda."
  type        = string
}

variable "lambda_function_role" {
  description = "ARN del rol de ejecución de la Lambda. Si no se especifica, se usará el rol creado por el módulo Lambda."
  type        = string
  default     = null
}

variable "lambda_function_runtime" {
  description = "Runtime de la Lambda (por ejemplo, python3.9)."
  type        = string
  default     = "python3.9"
}

variable "lambda_function_filename" {
  description = "Ruta del archivo ZIP con el código de la Lambda."
  type        = string
}

variable "lambda_function_handler" {
  description = "Nombre del archivo y método handler de la Lambda."
  type        = string
}

variable "lambda_function_architecture" {
  description = "Arquitectura de la Lambda (x86_64 o arm64)."
  type        = string
  default     = "x86_64"
}

variable "lambda_function_memory" {
  description = "Cantidad de memoria asignada a la Lambda (en MB)."
  type        = number
  default     = 128
}

variable "lambda_function_timeout" {
  description = "Tiempo máximo de ejecución de la Lambda (en segundos)."
  type        = number
  default     = 10
}

variable "lambda_function_description" {
  description = "Descripción de la función Lambda."
  type        = string
  default     = ""
}

variable "lambda_function_environment_variables" {
  description = "Mapa de variables de entorno para la Lambda."
  type        = map(string)
  default     = {}
}

############################
# Variables del API Gateway REST
############################

variable "apigateway_rest_name" {
  description = "Nombre del API Gateway REST."
  type        = string
}

variable "apigateway_rest_description" {
  description = "Descripción del API Gateway REST."
  type        = string
  default     = "API Gateway REST para Lambda"
}

variable "default_route_path_part" {
  description = "Path del recurso base del API Gateway REST."
  type        = string
  default     = "my-resource"
}

variable "lambda_integration_http_method" {
  description = "Método HTTP para la integración Lambda."
  type        = string
  default     = "POST"
}

############################
# Variables del WAF
############################

variable "waf_name" {
  description = "Nombre del Web ACL de AWS WAF."
  type        = string
}

variable "waf_description" {
  description = "Descripción del Web ACL."
  type        = string
  default     = "WAF para el API Gateway"
}

variable "rate_limit" {
  description = "Límite de solicitudes por minuto."
  type        = number
  default     = 2000
}

variable "waf_rules" {
  description = <<EOT
Lista de reglas para el WAF.
Cada regla debe ser un objeto con:
- name: Nombre de la regla.
- priority: Prioridad de la regla (entero).
- ip_set_arn: ARN del conjunto de IPs para bloquear.
- metric_name: Nombre de la métrica asociada a la regla.
EOT
  type = list(object({
    name        = string
    priority    = number
    ip_set_arn  = string
    metric_name = string
  }))
  default = []
}
