import azure.functions as func
import datetime
import json
import logging

app = func.FunctionApp()

@app.route(route="HttpExample", auth_level=func.AuthLevel.FUNCTION)
def HttpExample(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Deep - Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    if name:
        return func.HttpResponse(f"Hi, {name}. This HTTP triggered function executed successfully.")
    else:
        return func.HttpResponse(
             "This Deep HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
             status_code=200
        )
