def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A response object containing a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'OK'
        }
    }
    
    return response


# Example usage (this would typically be handled by AWS Lambda runtime)
if __name__ == "__main__":
    # Simulate a Lambda event
    test_event = {}
    test_context = None
    
    result = lambda_handler(test_event, test_context)
    print(result)