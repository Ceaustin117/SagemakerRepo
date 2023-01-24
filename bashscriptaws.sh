#Create S3 buckets if required before executing the commands.
S3_BUCKET=bucket-mlops #bucket to store AWS SAM template
S3_BUCKET_MODEL=ml-models   #bucket to store ML models
STACK_NAME=sam-sf-sagemaker-workflow   #Name of the AWS SAM stack
sam build  -t cfn/sam-template.yaml    #AWS SAM build 
sam deploy --template-file .aws-sam/build/template.yaml \
--stack-name ${STACK_NAME} --force-upload \
--s3-bucket ${S3_BUCKET} --s3-prefix sam \
--parameter-overrides S3ModelBucket=${S3_BUCKET_MODEL} \
--capabilities CAPABILITY_IAM