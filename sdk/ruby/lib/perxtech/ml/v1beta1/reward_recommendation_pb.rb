# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: perxtech/ml/v1beta1/reward_recommendation.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("perxtech/ml/v1beta1/reward_recommendation.proto", :syntax => :proto3) do
    add_message "perxtech.ml.v1beta1.GetRewardRecommendationRequest" do
      optional :tenant, :string, 1
      optional :user_id, :string, 2
      repeated :reward_ids, :string, 3
      optional :limit, :int32, 4
    end
    add_message "perxtech.ml.v1beta1.RewardRecommendationResponse" do
      repeated :recommended_reward_ids, :string, 1
    end
  end
end

module Perxtech
  module Ml
    module V1beta1
      GetRewardRecommendationRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("perxtech.ml.v1beta1.GetRewardRecommendationRequest").msgclass
      RewardRecommendationResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("perxtech.ml.v1beta1.RewardRecommendationResponse").msgclass
    end
  end
end