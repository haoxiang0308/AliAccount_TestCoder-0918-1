def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Success: Lambda function executed correctly!'
    }

# Example event and context for local testing (optional)
if __name__ == "__main__":
    # Example invocation
    test_event = {}
    test_context = type('Context', (), {'aws_request_id': 'test-id'})()
    response = lambda_handler(test_event, test_context)
    print(response)
