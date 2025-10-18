def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'success'
        }
    }
    
    return response