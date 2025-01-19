############################
# Outputs del consumidor
############################

# ARN de la función Lambda creada
output "lambda_arn" {
  description = "ARN de la función Lambda creada."
  value       = module.lambda.lambda_arn
}

# Nombre de la función Lambda creada
output "lambda_name" {
  description = "Nombre de la función Lambda creada."
  value       = module.lambda.lambda_name
}

# URL del endpoint del API Gateway creado
output "api_gateway_endpoint" {
  description = "URL del endpoint del API Gateway creado."
  value       = module.api_gateway.api_gateway_endpoint
}

# ARN de ejecución del API Gateway creado
output "api_gateway_execution_arn" {
  description = "ARN de ejecución del API Gateway creado."
  value       = module.api_gateway.api_gateway_execution_arn
}

# ID del API Gateway creado
output "api_gateway_id" {
  description = "ID del API Gateway creado."
  value       = module.api_gateway.api_gateway_id
}

# ARN del WAF asociado al API Gateway
output "waf_arn" {
  description = "ARN del WAF asociado al API Gateway."
  value       = module.waf.waf_arn
}
