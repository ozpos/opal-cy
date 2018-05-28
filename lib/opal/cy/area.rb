module CY
  class AreaGenerator
    include CY::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_cy_block :x
    attribute_cy_block :x0
    attribute_cy_block :x1
    attribute_cy_block :y
    attribute_cy_block :y0
    attribute_cy_block :y1
    attribute_cy_block :defined

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        CY::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end

    def line_x0
      CY::LineGenerator.new @native.JS.lineX0
    end

    def line_x1
      CY::LineGenerator.new @native.JS.lineX1
    end

    def line_y0
      CY::LineGenerator.new @native.JS.lineY0
    end

    def line_y1
      CY::LineGenerator.new @native.JS.lineY1
    end
  end

  class << self
    def area
      CY::AreaGenerator.new @cy.JS.area
    end
  end
end
