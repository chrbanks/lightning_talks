require 'aws-sdk'

aws_config = Rails.configuration.x.aws

Aws.config.update({
  region: aws_config['region'],
  credentials: Aws::Credentials.new(
    aws_config['access_key_id'],
    aws_config['secret_access_key']
  ),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(aws_config['bucket'])
