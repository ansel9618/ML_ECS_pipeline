# ML_ECS_pipeline
A ML containerisation project which makes use of ECS to deploy a streamlit app which can query data from postgres rds in aws


# AWS_Dynamo_lambda_Snowflake_Pipeline

Completed a automated pipeline using AWS Eventbridge,lambda,DynamoDB,s3 & snowflake.

![Architecture](https://github.com/ansel9618/AWS_Dynamo_lambda_Snowflake_Pipeline/blob/main/images/aws_dynamo_snowflake_pipeline.png)

In this pipeline:

* First we created a weather api and got the api key

* A python script was deployed in a lambda function which is triggered every 1 hr
  with the help of aws cloudwatch-eventbridge.

* The first lambda lambda function will take data from weather api and store it in Dynamodb table.

* Once data is populated in dynamodb ,a dynamodbstream is set to start automatically and 
  the stream will be processed by second lambda function which will push to a S3 bucket

* For s3 and snowflake to interact a storage integration needs to be created in snowflake
  and should have a connection to IAM which can be estabished using the role ARN and 
  IAM_USER_ARN and the External_ID specified by the storage integration.

* Snowflake external stage can be created using the storage integration name, 
  which allows access to the data in the S3 bucket(external stage) through the IAM role.

* S3 bucket when populated will send a notification via SQS to snowpipe 
  which is created using the external stage name
  (Note:-here a event notification needs to be created in s3 bucket with the notification
  channel sqs of the snowpipe created)

* Snowpipe once notified will ingest data from S3(external stage) & populate the data
  in weather_table in snowflake db
