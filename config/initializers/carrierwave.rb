CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS', # required
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],          # required unless using use_iam_profile
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],  # required unless using use_iam_profile
      region: ENV['S3_DEFAULT_REGION'],                    # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'originalapp-recruitingsite-s3bucket'                 # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
    # config.cache_storage = :file
  end