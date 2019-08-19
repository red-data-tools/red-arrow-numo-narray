# Copyright 2017-2019 Sutou Kouhei <kou@clear-code.com>
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

module Arrow
  class Int8DataType
    def narray_class
      Numo::Int8
    end
  end

  class Int16DataType
    def narray_class
      Numo::Int16
    end
  end

  class Int32DataType
    def narray_class
      Numo::Int32
    end
  end

  class Int64DataType
    def narray_class
      Numo::Int64
    end
  end

  class UInt8DataType
    def narray_class
      Numo::UInt8
    end
  end

  class UInt16DataType
    def narray_class
      Numo::UInt16
    end
  end

  class UInt32DataType
    def narray_class
      Numo::UInt32
    end
  end

  class UInt64DataType
    def narray_class
      Numo::UInt64
    end
  end

  class FloatDataType
    def narray_class
      Numo::SFloat
    end
  end

  class DoubleDataType
    def narray_class
      Numo::DFloat
    end
  end

  class Array
    def to_narray
      unless n_nulls.zero?
        message = "can't convert #{self.class} that has null values to NArray"
        raise ArrowNumoNArray::UnconvertibleError, message
      end
      narray = value_data_type.narray_class.new(length)
      narray.store_binary(buffer.data.to_s)
      narray
    end
  end

  class ChunkedArray
    def to_narray
      unless n_nulls.zero?
        message = "can't convert #{self.class} that has null values to NArray"
        raise ArrowNumoNArray::UnconvertibleError, message
      end
      narray = value_data_type.narray_class.new(length)
      data = ""
      chunks.each do |chunk|
        data << chunk.buffer.data.to_s
      end
      narray.store_binary(data)
      narray
    end
  end

  class Tensor
    def to_narray
      narray = value_data_type.narray_class.new(shape)
      narray.store_binary(buffer.data.to_s)
      narray
    end
  end
end
