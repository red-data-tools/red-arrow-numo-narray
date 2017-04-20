# Copyright 2017 Kouhei Sutou <kou@clear-code.com>
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

module Numo
  module ArrowConvertable
    def to_arrow
      Arrow::Tensor.new(arrow_data_type,
                        Arrow::Buffer.new(to_binary),
                        shape,
                        nil,
                        nil)
    end
  end

  class Int8
    include ArrowConvertable

    def arrow_data_type
      Arrow::Int8DataType.new
    end
  end

  class Int16
    include ArrowConvertable

    def arrow_data_type
      Arrow::Int16DataType.new
    end
  end

  class Int32
    include ArrowConvertable

    def arrow_data_type
      Arrow::Int32DataType.new
    end
  end

  class Int64
    include ArrowConvertable

    def arrow_data_type
      Arrow::Int64DataType.new
    end
  end

  class UInt8
    include ArrowConvertable

    def arrow_data_type
      Arrow::UInt8DataType.new
    end
  end

  class UInt16
    include ArrowConvertable

    def arrow_data_type
      Arrow::UInt16DataType.new
    end
  end

  class UInt32
    include ArrowConvertable

    def arrow_data_type
      Arrow::UInt32DataType.new
    end
  end

  class UInt64
    include ArrowConvertable

    def arrow_data_type
      Arrow::UInt64DataType.new
    end
  end

  class SFloat
    include ArrowConvertable

    def arrow_data_type
      Arrow::FloatDataType.new
    end
  end

  class DFloat
    include ArrowConvertable

    def arrow_data_type
      Arrow::DoubleDataType.new
    end
  end
end
