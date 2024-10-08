import json

def handler(event, context):
    name = event.get('name', 'Guest')
    greeting_message = f"Greetings, {name}!"
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': greeting_message
        })
    }
