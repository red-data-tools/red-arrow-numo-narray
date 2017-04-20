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

class ToArrowTest < Test::Unit::TestCase
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
    narray = Numo::Int8.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("c*"))
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
    narray = Numo::Int16.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("s*"))
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
    narray = Numo::Int32.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("l*"))
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
    narray = Numo::Int64.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("q*"))
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
    narray = Numo::UInt8.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("C*"))
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
    narray = Numo::UInt16.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("S*"))
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
    narray = Numo::UInt32.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("L*"))
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
    narray = Numo::UInt64.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("Q*"))
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
    narray = Numo::SFloat.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("f*"))
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
    narray = Numo::DFloat.new(shape).store(data)
    assert_equal(data.flatten,
                 narray.to_arrow.buffer.data.to_s.unpack("d*"))
  end
end
