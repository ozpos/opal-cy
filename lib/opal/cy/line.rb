module CY
  class LineGenerator
    include CY::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_cy_block :x
    attribute_cy_block :y
    attribute_cy_block :defined

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        CY::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end
  end

  class << self
    def line
      CY::LineGenerator.new @cy.JS.line
    end
  end
end
