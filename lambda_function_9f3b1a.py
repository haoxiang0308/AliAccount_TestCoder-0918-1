import json

def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success!',
            'event': event # Echo back the received event for debugging
        })
    }
