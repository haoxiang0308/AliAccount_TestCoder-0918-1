def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event (dict): Event data passed to the Lambda function
        context (object): Runtime information of the Lambda function
        
    Returns:
        dict: Response object with success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'ok'
        }
    }
    
    return response

# Example usage (optional, for testing purposes)
if __name__ == "__main__":
    # Simulate a Lambda invocation
    test_event = {}
    test_context = None
    result = lambda_handler(test_event, test_context)
    print(result)