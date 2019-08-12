#!/usr/bin/with-contenv bashio
#=======================================#
#                                       #
#      Sync Hass.io Backups to S3.      #
#                                       #
#=======================================#

# AWS Credentials
export AWS_ACCESS_KEY_ID=$(bashio::config 'aws_access_key')
export AWS_SECRET_ACCESS_KEY=$(bashio::config 'aws_secret_key')

# Bucket to Sync to 
BUCKET=$(bashio::config 'aws_s3_bucket')

bashio::log.debug "Find Backup Directory"
bashio::log.debug "Found: $(cd / && find . -type d -name 'backup')"

# Run our Sync Command -- We should make sure that we can
# Error if no internet or something
bashio::log.info "Running command: aws s3 sync /backup/ s3://$BUCKET/"
aws s3 sync /backup/ s3://$BUCKET/ > /dev/null

bashio::log.info "Contents of $FOLDER backed up to s3://$BUCKET"
aws s3 sync /backup/ s3://$BUCKET/ > /dev/null

