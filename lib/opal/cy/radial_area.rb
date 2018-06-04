module CY
  class RadialAreaGenerator
    include CY::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_cy_block :angle
    attribute_cy_block :startAngle
    attribute_cy_block :endAngle
    attribute_cy_block :radius
    attribute_cy_block :innerRadius
    attribute_cy_block :outerRadius
    attribute_cy_block :defined

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        CY::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end

    def line_start_angle
      CY::RadialLineGenerator.new @native.JS.lineStartAngle
    end

    def line_end_angle
      CY::RadialLineGenerator.new @native.JS.lineEndAngle
    end

    def line_inner_radius
      CY::RadialLineGenerator.new @native.JS.lineInnerRadius
    end

    def line_outer_radius
      CY::RadialLineGenerator.new @native.JS.lineOuterRadius
    end
  end

  class << self
    def radial_area
      CY::RadialAreaGenerator.new @cy.JS.radialArea
    end
  end
end
