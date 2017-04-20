# README

## Name

Red Arrow Numo::NArray

## Description

Red Arrow Numo::NArray is a library that provides converters between Apache Arrow's tensor data (`Arrow::Tensor`) and Numo::NArray data.

Red Arrow Numo::NArray adds `Arrow::Tensor#to_narray` and `#to_arrow` to `Numo::NArray`'s numerical subclasses such as `Numo::Int8`. `Arrow::Tensor#to_narray` returns a `Numo::NArray`'s numerical subclass such as `Numo::Int8`. `#to_arrow` returns a `Arrow::Tensor`.

## Install

```text
% gem install red-arrow-numo-narray
```

## Usage

```ruby
require "arrow-numo-narray"

tensor.to_narray # -> A Numo::NArray's numeric subclass such as Numo::Int8
narray.to_arrow  # -> An Arrow::Tensor object
```

## Dependencies

* [Red Arrow](https://github.com/red-data-tools/red-arrow)

* [Numo::NArray](http://ruby-numo.github.io/narray/)

## Authors

* Kouhei Sutou \<kou@clear-code.com\>

## License

Apache License 2.0. See doc/text/apache-2.0.txt for details.

(Kouhei Sutou has a right to change the license including contributed
patches.)
