CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:               'AWS',                        # required
    aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],     # required
    aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'], # required
    region:                 ENV['AWS_REGION'],            # optional, defaults to 'us-east-1'

  }
  config.fog_directory  = 'invebos'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end