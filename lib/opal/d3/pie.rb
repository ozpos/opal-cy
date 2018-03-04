module D3
  class PieGenerator
    include D3::Native
    def call(*args)
      @native.call(*args).map{|o|
        `Opal.hash({ data: o.data, index: o.index, value: o.value, start_angle: o.startAngle, end_angle: o.endAngle, pad_angle: o.padAngle })`
      }
    end

    attribute_d3_block :startAngle
    attribute_d3_block :endAngle
    attribute_d3_block :padAngle
    attribute_d3_block :value
    attribute_d3_block :sort
    attribute_d3_block :sortValues
  end

  class << self
    def pie
      D3::PieGenerator.new @d3.JS.pie
    end
  end
end
