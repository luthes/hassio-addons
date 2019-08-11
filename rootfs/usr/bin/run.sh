#!/usr/bin/with-contenv bashio
#========================================
#
#    Sync Hass.io Backups to S3. 
#
#========================================

# AWS Variables
export AWS_ACCESS_KEY_ID=$(bashio::config 'aws_access_key')
export AWS_SECRET_ACCESS_KEY=$(bashio::config 'aws_secret_key')

# Bucket to Sync to 
BUCKET=$(bashio::config 'aws_s3_bucket')

# Some Debug stuff
bashio::log.info "Checking Log Directories"
bashio::log.info "$(cd / && ls -lsa)"

# Run our Sync Command -- We should make sure that we can
# Error if no internet or something
bashio::log.info "Running command: aws s3 sync /backup/ s3://$BUCKET/"
aws s3 sync /backup/ s3://$BUCKET/
