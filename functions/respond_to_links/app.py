import json
import boto3
sf = boto3.client('stepfunctions')
def lambda_handler(event, context):
    type = event['type']
    token= event['token']     
    
    if type =='success':
        sf.send_task_success(
        taskToken=token,
        output="{}"
    )
    else:
        sf.send_task_failure(
        taskToken=token
        
    )

    

    return {
        'statusCode': 200,
        'body': json.dumps('Responded to Step Function')
    }
