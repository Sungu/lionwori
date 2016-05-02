CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:  'AKIAJUKEMX3XHA7YHEXQ',
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  
  }
  config.fog_directory  = 'lionwori'                          
end