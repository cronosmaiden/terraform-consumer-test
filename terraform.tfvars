region = "us-east-1"

lambda_function_name        = "test-lambda-new"
lambda_function_filename    = "lambda_function.zip"
lambda_function_handler     = "lambda_function.lambda_handler"

apigateway_rest_name        = "test-api-gateway-rest"
default_route_path_part     = "my-resource"
lambda_integration_http_method = "POST"

waf_name                    = "test-waf-new"
rate_limit                  = 1000

waf_rules = [
  {
    name        = "block-specific-ips"
    priority    = 1
    ip_set_arn  = "arn:aws:wafv2:us-east-1:801995017684:regional/ipset/block-specific-ips/31b22dd8-5f12-469b-bcc5-b59894355ef4"
    metric_name = "blocked-ips-metric"
  }
]
