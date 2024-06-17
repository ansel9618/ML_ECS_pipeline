# ML_ECS_pipeline
A ML containerisation project which makes use of ECS to deploy a streamlit app which can query data from postgres rds in aws which is populated using a automated labmbda function by making use of a NewsAPI

![Architecture](https://github.com/ansel9618/ML_ECS_pipeline/blob/main/images/Architecture.png)

In this project

* We are making use of a NewsAPI where we get the latest news articles with help of a API_Key obtained from the news api website
  after creating a developer account

* News articles are extracted with the help of a lambda function which is triggered every 1 hr using Event bridge.

* The raw data extrated are pushed to a S3 bucket and stored in json format
  ![](https://github.com/ansel9618/ML_ECS_pipeline/blob/main/images/10.0_.png)

* News description are then analyzed using the using NLTK python library w.r.t the news article topic and based on the news sentiment a positive or negative score is assigned.
  ![](https://github.com/ansel9618/ML_ECS_pipeline/blob/main/images/3.0_.png)

* Analyzed  news aritcle are pushed to a rds postgres AWS instance along with timestamp.
  ![](https://github.com/ansel9618/ML_ECS_pipeline/blob/main/images/1.0_.png)
  ![](https://github.com/ansel9618/ML_ECS_pipeline/blob/main/images/9.0_.png)
  
* Now a Dashboard is created using Streamlit to visualize the sentiment of the news in local system which is then converted to a docker image and pushed to ECR Registry in AWS.

* The uploaded image is run using a AWS Fargate cluster by create a task definition and using the publicIP and assigned port
  we can access the Streamlit Dashboard.

