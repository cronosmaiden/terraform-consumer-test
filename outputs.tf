############################
# Outputs del consumidor
############################

output "lambda_arn" {
  description = "ARN de la función Lambda creada."
  value       = module.lambda.lambda_arn
}

output "lambda_name" {
  description = "Nombre de la función Lambda creada."
  value       = module.lambda.lambda_function_name
}

output "api_gateway_endpoint" {
  description = "URL del endpoint del API Gateway REST creado."
  value       = module.api_gateway.api_gateway_endpoint
}

output "api_gateway_execution_arn" {
  description = "ARN de ejecución del API Gateway REST creado."
  value       = module.api_gateway.api_gateway_execution_arn
}

output "api_gateway_id" {
  description = "ID del API Gateway REST creado."
  value       = module.api_gateway.api_gateway_id
}

output "waf_arn" {
  description = "ARN del WAF asociado al API Gateway."
  value       = module.waf.waf_arn
}
