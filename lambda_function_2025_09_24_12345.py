def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.

    Args:
        event: The event data passed to the Lambda function.
        context: The runtime information of the Lambda function.

    Returns:
        dict: A dictionary containing the statusCode and body.
    """
    return {
        'statusCode': 200,
        'body': 'Lambda function executed successfully!'
    }
