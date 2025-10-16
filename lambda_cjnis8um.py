import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object passed to the Lambda function.
    context (object): The context object passed to the Lambda function.
    
    Returns:
    dict: A response object with a success message.
    """
    # Create a success response
    response = {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Success! The Lambda function executed successfully.",
            "status": "ok"
        }),
        "headers": {
            "Content-Type": "application/json"
        }
    }
    
    return response


# Example invocation for testing purposes
if __name__ == "__main__":
    # Simulate an event and context for local testing
    test_event = {}
    test_context = type('Context', (object,), {
        'function_name': 'test_lambda',
        'memory_limit_in_mb': 128,
        'invoked_function_arn': 'arn:aws:lambda:us-east-1:123456789012:function:test_lambda'
    })()
    
    result = lambda_handler(test_event, test_context)
    print(json.dumps(result, indent=2))