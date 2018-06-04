module CY
  class ArcGenerator
    include CY::Native
    def call(*args)
      @native.call(*args)
    end

    attribute_cy_block :innerRadius
    attribute_cy_block :outerRadius
    attribute_cy_block :cornerRadius
    attribute_cy_block :startAngle
    attribute_cy_block :endAngle
 #   alias_native :centroid
  end

  class << self
    def arc
      CY::ArcGenerator.new @cy.JS.arc
    end
  end
end
