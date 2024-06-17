# ML_ECS_pipeline
A ML containerisation project which makes use of ECS to deploy a streamlit app which can query data from postgres rds in aws


# AWS_Dynamo_lambda_Snowflake_Pipeline

Completed a automated pipeline using AWS Eventbridge,lambda,DynamoDB,s3 & snowflake.

![Architecture](https://github.com/ansel9618/ML_ECS_pipeline/blob/main/images/Architecture.png)

In this project

* We are making use of a NewsAPI where we get the latest news articles with help of a API_Key obtained from the news api website
  after creating a developer account

-News articles are extracted with the help of a lambda function which is triggered every 1 hr using Event bridge.

-The raw data extrated are pushed to a S3 bucket and stored in json format 

-News description are then analyzed using the using NLTK python library w.r.t the news article topic 

-Based on the news sentiment a positive or negative score is assigned to the news aritcle which is pushed to a rds postgres AWS instance along with timestamp.

-Now a Dashboard is created using Streamlit to visualize the sentiment of the news in local system which is then converted to a docker image and pushed to ECR Registry in AWS.

-The uploaded image is run using a AWS Fargate cluster by create a task definition and using the publicIP and assigned port
we can access the Streamlit Dashboard.

