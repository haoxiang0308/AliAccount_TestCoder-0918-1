def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Function executed successfully!'
    }

# Example invocation (for local testing)
if __name__ == "__main__":
    print(lambda_handler({}, {}))