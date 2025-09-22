def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event (dict): AWS Lambda event object
        context (object): AWS Lambda context object
        
    Returns:
        dict: Response object with statusCode and body
    """
    # Return a success response
    return {
        'statusCode': 200,
        'body': 'Success! The Lambda function executed successfully.'
    }