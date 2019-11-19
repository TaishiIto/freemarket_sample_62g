if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      #S3のリージョン #ap-northeast-1はアジアパシフィック(東京)
      region: 'ap-northeast-1'
    }
    # S3のバケット名
    config.fog_directory  = 'freemarket62g'
    # S3に保存しておく期間
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
end