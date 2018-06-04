module CY
  class PieGenerator
    include CY::Native
    def call(*args)
      @native.call(*args).map{|o|
        `Opal.hash({ data: o.data, index: o.index, value: o.value, start_angle: o.startAngle, end_angle: o.endAngle, pad_angle: o.padAngle })`
      }
    end

    attribute_cy_block :startAngle
    attribute_cy_block :endAngle
    attribute_cy_block :padAngle
    attribute_cy_block :value
    attribute_cy_block :sort
    attribute_cy_block :sortValues
  end

  class << self
    def pie
      CY::PieGenerator.new @cy.JS.pie
    end
  end
end
