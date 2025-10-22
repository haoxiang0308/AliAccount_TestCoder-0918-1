def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message
    """
    # Return a success response
    return {
        'statusCode': 200,
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'ok'
        },
        'headers': {
            'Content-Type': 'application/json'
        }
    }