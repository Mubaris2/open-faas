def handle(event, context):
    return {
        "statusCode": 200,
        "body": "Hello from OpenFaaS!"
    }

if __name__ == "__main__":
    print(handle({}, {}))