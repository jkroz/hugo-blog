
# Please note that `terraform destroy` may fail as it is not possible to delete a Lambda replicated function. If that's the case, the error message will be similar to:
# Error: Error deleting Lambda Function: InvalidParameterValueException: Lambda was unable to delete arn:aws:lambda:us-east-1:<redacted>:function:cloudfront-folder-index-redirect:4 because it is a replicated function. Please see our documentation for Deleting Lambda@Edge Functions and Replicas.
# { Message_: "Lambda was unable to delete arn:aws:lambda:us-east-1:<redacted>:function:cloudfront-folder-index-redirect:4 because it is a replicated function. Please see our documentation for Deleting Lambda@Edge Functions and Replicas."}

# The function will be automatically deleted a few hours after you have removed the last association for the function from all of your CloudFront distributions
# Documentation: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/lambda-edge-delete-replicas.html
