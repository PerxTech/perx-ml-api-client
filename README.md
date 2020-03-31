# perx-ml-api-client
SDK for perx-ml-api

This project keeps SDK for `perx-ml-api`.

## API Endpoints and API Key

Perx ML API is exposed as GRPCs service protected by API key.

Production endpoint (port 443 with TLS): `ml-api.data.perxtech.net`

## Ruby SDK

### Installation

To add the gem into your application, add this to your `Gemfile`:

```ruby
gem 'perxtech-ml', git: 'https://github.com/PerxTech/perx-ml-api-client.git', glob: 'sdk/ruby/*.gemspec'
```

### Gem Usage

To use the sdk, a `client` need to be initiated with endpoint and API key.

```ruby
require 'perxtech/ml/v1beta1'

endpoint = "ml-api.data.perxtech.net"
# Replace api_key with actual value
api_key = ""

client = Perxtech::Ml::V1beta1::RewardRecommendation::Client.new do |config|
  config.credentials = GRPC::Core::Channel.new(endpoint, nil, GRPC::Core::ChannelCredentials.new())
  config.endpoint = endpoint
  config.metadata = {
    :"x-api-key" => api_key
  }
end

# replace the payload with actual values
response = client.get_recommendation({
  tenant: 'tenant_a',
  user_id: 'xxxx',
  reward_ids: [
    "1",
    "2",
    "3",
    "4",
    "5"
  ],
  limit: 10
})
```
