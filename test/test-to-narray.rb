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

class ToNAarrayTest < Test::Unit::TestCase
  sub_test_case("Array") do
    test("Int8") do
      array = Arrow::Int8Array.new([-(2 ** 7), 0, 2 ** 7 - 1])
      assert_equal(Numo::Int8[-(2 ** 7), 0, 2 ** 7 - 1],
                   array.to_narray)
    end

    test("Int16") do
      array = Arrow::Int16Array.new([-(2 ** 15), 0, 2 ** 15 - 1])
      assert_equal(Numo::Int16[-(2 ** 15), 0, 2 ** 15 - 1],
                   array.to_narray)
    end

    test("Int32") do
      array = Arrow::Int32Array.new([-(2 ** 31), 0, 2 ** 31 - 1])
      assert_equal(Numo::Int32[-(2 ** 31), 0, 2 ** 31 - 1],
                   array.to_narray)
    end

    test("Int64") do
      array = Arrow::Int64Array.new([-(2 ** 63), 0, 2 ** 63 - 1])
      assert_equal(Numo::Int64[-(2 ** 63), 0, 2 ** 63 - 1],
                   array.to_narray)
    end

    test("UInt8") do
      array = Arrow::UInt8Array.new([0, 2 ** 8 - 1])
      assert_equal(Numo::UInt8[0, 2 ** 8 - 1],
                   array.to_narray)
    end

    test("UInt16") do
      array = Arrow::UInt16Array.new([0, 2 ** 16 - 1])
      assert_equal(Numo::UInt16[0, 2 ** 16 - 1],
                   array.to_narray)
    end

    test("UInt32") do
      array = Arrow::UInt32Array.new([0, 2 ** 32 - 1])
      assert_equal(Numo::UInt32[0, 2 ** 32 - 1],
                   array.to_narray)
    end

    test("UInt64") do
      array = Arrow::UInt64Array.new([0, 2 ** 64 - 1])
      assert_equal(Numo::UInt64[0, 2 ** 64 - 1],
                   array.to_narray)
    end

    test("Float") do
      array = Arrow::FloatArray.new([-1.1, 0, 1.1])
      assert_equal(Numo::SFloat[-1.1, 0, 1.1],
                   array.to_narray)
    end

    test("Double") do
      array = Arrow::DoubleArray.new([-1.1, 0, 1.1])
      assert_equal(Numo::DFloat[-1.1, 0, 1.1],
                   array.to_narray)
    end
  end

  sub_test_case("Tensor") do
    test("Int8") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [-1, -2, -3, -4],
        ],
        [
          [-5, -6, -7, -8],
          [-9, -10, -11, -12],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::Int8DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("c*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::Int8.new(shape).store(data),
                   tensor.to_narray)
    end

    test("Int16") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [-1, -2, -3, -4],
        ],
        [
          [-5, -6, -7, -8],
          [-9, -10, -11, -12],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::Int16DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("s*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::Int16.new(shape).store(data),
                   tensor.to_narray)
    end

    test("Int32") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [-1, -2, -3, -4],
        ],
        [
          [-5, -6, -7, -8],
          [-9, -10, -11, -12],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::Int32DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("l*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::Int32.new(shape).store(data),
                   tensor.to_narray)
    end

    test("Int64") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [-1, -2, -3, -4],
        ],
        [
          [-5, -6, -7, -8],
          [-9, -10, -11, -12],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::Int64DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("q*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::Int64.new(shape).store(data),
                   tensor.to_narray)
    end

    test("UInt8") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [13, 14, 15, 16],
        ],
        [
          [17, 18, 19, 20],
          [21, 22, 23, 24],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::UInt8DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("C*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::UInt8.new(shape).store(data),
                   tensor.to_narray)
    end

    test("UInt16") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [13, 14, 15, 16],
        ],
        [
          [17, 18, 19, 20],
          [21, 22, 23, 24],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::UInt16DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("S*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::UInt16.new(shape).store(data),
                   tensor.to_narray)
    end

    test("UInt32") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [13, 14, 15, 16],
        ],
        [
          [17, 18, 19, 20],
          [21, 22, 23, 24],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::UInt32DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("L*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::UInt32.new(shape).store(data),
                   tensor.to_narray)
    end

    test("UInt64") do
      data = [
        [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
        ],
        [
          [9, 10, 11, 12],
          [13, 14, 15, 16],
        ],
        [
          [17, 18, 19, 20],
          [21, 22, 23, 24],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::UInt64DataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("Q*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::UInt64.new(shape).store(data),
                   tensor.to_narray)
    end

    test("Float") do
      data = [
        [
          [1.0, 2.0, 3.0, 4.0],
          [5.0, 6.0, 7.0, 8.0],
        ],
        [
          [9.0, 10.0, 11.0, 12.0],
          [13.0, 14.0, 15.0, 16.0],
        ],
        [
          [17.0, 18.0, 19.0, 20.0],
          [21.0, 22.0, 23.0, 24.0],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::FloatDataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("f*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::SFloat.new(shape).store(data),
                   tensor.to_narray)
    end

    test("Double") do
      data = [
        [
          [1.0, 2.0, 3.0, 4.0],
          [5.0, 6.0, 7.0, 8.0],
        ],
        [
          [9.0, 10.0, 11.0, 12.0],
          [13.0, 14.0, 15.0, 16.0],
        ],
        [
          [17.0, 18.0, 19.0, 20.0],
          [21.0, 22.0, 23.0, 24.0],
        ],
      ]
      shape = [3, 2, 4]
      tensor = Arrow::Tensor.new(Arrow::DoubleDataType.new,
                                 Arrow::Buffer.new(data.flatten.pack("d*")),
                                 shape,
                                 nil,
                                 nil)
      assert_equal(Numo::DFloat.new(shape).store(data),
                   tensor.to_narray)
    end
  end
end
