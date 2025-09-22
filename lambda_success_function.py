import json
import random
import string


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event (dict): AWS Lambda event object
        context (object): AWS Lambda context object
        
    Returns:
        dict: Response object with status code and message
    """
    
    # Generate a random success message ID
    message_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    
    # Create response
    response = {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success! Operation completed successfully.',
            'messageId': message_id,
            'status': 'SUCCESS'
        })
    }
    
    return response


# For local testing
if __name__ == "__main__":
    # Simulate a Lambda event and context
    test_event = {}
    test_context = None
    
    # Call the function
    result = lambda_handler(test_event, test_context)
    
    # Print the result
    print(json.dumps(result, indent=2))