# -*- coding: utf-8 -*-

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import proto  # type: ignore


__protobuf__ = proto.module(
    package='perxtech.ml.v1beta1',
    manifest={
        'RewardRecommendationRequest',
        'RewardRecommendationResponse',
    },
)


class RewardRecommendationRequest(proto.Message):
    r"""

    Attributes:
        tenant (str):

        user_id (str):

        reward_ids (Sequence[str]):

        limit (int):

    """

    tenant = proto.Field(proto.STRING, number=1)
    user_id = proto.Field(proto.STRING, number=2)
    reward_ids = proto.RepeatedField(proto.STRING, number=3)
    limit = proto.Field(proto.INT32, number=4)


class RewardRecommendationResponse(proto.Message):
    r"""

    Attributes:
        reward_ids (Sequence[str]):

    """

    reward_ids = proto.RepeatedField(proto.STRING, number=1)


__all__ = tuple(sorted(__protobuf__.manifest))
