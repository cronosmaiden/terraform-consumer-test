import os
import json

def lambda_handler(event, context):
    """
    Función Lambda que devuelve las variables de entorno configuradas
    y el evento recibido desde el API Gateway.
    """
    # Obtener las variables de entorno
    environment_variables = dict(os.environ)

    # Crear la respuesta
    response = {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Hello from Lambda!",
            "environment_variables": environment_variables,
            "event_received": event
        })
    }

    return response
