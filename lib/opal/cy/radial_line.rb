module CY
  class RadialLineGenerator
    include CY::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_cy_block :angle
    attribute_cy_block :radius
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
    def radial_line
      CY::RadialLineGenerator.new @cy.JS.radialLine
    end
  end
end
