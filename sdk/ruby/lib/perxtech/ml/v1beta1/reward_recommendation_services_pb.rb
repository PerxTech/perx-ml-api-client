# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: perxtech/ml/v1beta1/reward_recommendation.proto for package 'perxtech.ml.v1beta1'

require 'grpc'
require 'perxtech/ml/v1beta1/reward_recommendation_pb'

module Perxtech
  module Ml
    module V1beta1
      module RewardRecommendation
        class Service

          include GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'perxtech.ml.v1beta1.RewardRecommendation'

          rpc :GetRecommendation, RewardRecommendationRequest, RewardRecommendationResponse
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
