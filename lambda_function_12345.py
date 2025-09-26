def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Success: Lambda function executed successfully!'
    }

# Example usage (this part is typically not executed by AWS Lambda directly):
# if __name__ == "__main__":
#     print(lambda_handler({}, {}))