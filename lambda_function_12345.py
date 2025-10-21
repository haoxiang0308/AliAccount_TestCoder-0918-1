def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event: The event object passed to the Lambda function.
        context: The context object containing runtime information.
        
    Returns:
        A dictionary containing a success message with HTTP status code 200.
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'OK'
        },
        'headers': {
            'Content-Type': 'application/json'
        }
    }
    
    return response


# Example usage for testing locally (optional)
if __name__ == "__main__":
    # Simulate a Lambda event and context
    test_event = {}
    test_context = type('Context', (), {'aws_request_id': 'test-id'})()
    
    result = lambda_handler(test_event, test_context)
    print(result)