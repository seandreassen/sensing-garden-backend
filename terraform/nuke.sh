terraform state rm aws_dynamodb_table.sensor_detections
terraform state rm aws_dynamodb_table.sensor_classifications
terraform state rm aws_dynamodb_table.models
terraform state rm aws_dynamodb_table.videos
terraform state rm aws_dynamodb_table.environmental_readings
terraform state rm aws_dynamodb_table.devices

aws dynamodb delete-table --table-name sensing-garden-detections
aws dynamodb delete-table --table-name sensing-garden-classifications
aws dynamodb delete-table --table-name sensing-garden-models
aws dynamodb delete-table --table-name sensing-garden-videos
aws dynamodb delete-table --table-name sensing-garden-environmental-readings
aws dynamodb delete-table --table-name sensing-garden-devices

aws lambda delete-function --function-name sensing-garden-api-handler

# IAM role
aws iam detach-role-policy --role-name lambda_exec_role --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess
aws iam detach-role-policy --role-name lambda_exec_role --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam delete-role --role-name lambda_exec_role

# S3 buckets
aws s3 rb s3://scl-sensing-garden-images-827202648234 --force
aws s3 rb s3://scl-sensing-garden-videos-827202648234 --force
aws s3 rb s3://scl-sensing-garden-models-827202648234 --force
