# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "perxtech/ml/v1beta1/reward_recommendation_pb"
require "perxtech/ml/v1beta1/reward_recommendation_services_pb"
require "perxtech/ml/v1beta1/reward_recommendation"

class Perxtech::Ml::V1beta1::RewardRecommendation::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_get_recommendation
    # Create GRPC objects.
    grpc_response = Perxtech::Ml::V1beta1::RewardRecommendationResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    tenant = "hello world"
    user_id = "hello world"
    reward_ids = ["hello world"]
    limit = 42

    get_recommendation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_recommendation, name
      assert_kind_of Perxtech::Ml::V1beta1::RewardRecommendationRequest, request
      assert_equal "hello world", request.tenant
      assert_equal "hello world", request.user_id
      assert_equal ["hello world"], request.reward_ids
      assert_equal 42, request.limit
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_recommendation_client_stub do
      # Create client
      client = Perxtech::Ml::V1beta1::RewardRecommendation::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_recommendation({ tenant: tenant, user_id: user_id, reward_ids: reward_ids, limit: limit }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_recommendation tenant: tenant, user_id: user_id, reward_ids: reward_ids, limit: limit do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_recommendation Perxtech::Ml::V1beta1::RewardRecommendationRequest.new(tenant: tenant, user_id: user_id, reward_ids: reward_ids, limit: limit) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_recommendation({ tenant: tenant, user_id: user_id, reward_ids: reward_ids, limit: limit }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_recommendation Perxtech::Ml::V1beta1::RewardRecommendationRequest.new(tenant: tenant, user_id: user_id, reward_ids: reward_ids, limit: limit), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_recommendation_client_stub.call_rpc_count
    end
  end
end
