region = "us-east-1"

lambda_function_name        = "test-lambda"
lambda_function_filename    = "lambda_function.zip"
lambda_function_handler     = "lambda_function.lambda_handler"

apigateway_http_name        = "test-api-gateway"
cognito_authorizer_name     = "test-cognito-authorizer"
cognito_audience            = ["my-audience"]
cognito_issuer              = "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_vOMqDsNli"

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
