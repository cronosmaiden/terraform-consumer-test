############################
# Configuración del provider
############################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.45.0"
    }
  }
  required_version = ">= 1.5.2"
}

provider "aws" {
  region = var.region
}

############################
# Módulo Lambda
############################

module "lambda" {
  source = "git::https://github.com/cronosmaiden/terraform-module-test.git//lambda?ref=main"

  lambda_function_name               = var.lambda_function_name
  lambda_function_role               = var.lambda_function_role
  lambda_function_runtime            = var.lambda_function_runtime
  lambda_function_filename           = var.lambda_function_filename
  lambda_function_handler            = var.lambda_function_handler
  lambda_function_architecture       = var.lambda_function_architecture
  lambda_function_memory             = var.lambda_function_memory
  lambda_function_timeout            = var.lambda_function_timeout
  lambda_function_description        = var.lambda_function_description
  lambda_function_environment_variables = var.lambda_function_environment_variables
  api_gateway_source_arn = module.api_gateway.api_gateway_execution_arn
}

############################
# Módulo API Gateway REST
############################

module "api_gateway" {
  source = "git::https://github.com/cronosmaiden/terraform-module-test.git//api_gateway?ref=main"

  apigateway_rest_name           = var.apigateway_rest_name
  apigateway_rest_description    = var.apigateway_rest_description
  default_route_path_part        = var.default_route_path_part
  lambda_integration_uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${module.lambda.lambda_arn}/invocations"
  lambda_integration_http_method = var.lambda_integration_http_method
  waf_arn                        = module.waf.waf_arn
  region                         = var.region
}

############################
# Módulo WAF
############################

module "waf" {
  source = "git::https://github.com/cronosmaiden/terraform-module-test.git//waf?ref=main"

  waf_name        = var.waf_name
  waf_description = var.waf_description
  rate_limit      = var.rate_limit

  waf_rules   = var.waf_rules
  resource_arn = module.api_gateway.api_gateway_stage_arn
  region       = var.region
  api_gateway_id = module.api_gateway.api_gateway_id
}
