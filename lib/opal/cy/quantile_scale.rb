module CY
  class QuantileScale
    include CY::Native

    def call(t)
      @native.call(t)
    end

    attribute_cy :domain
    attribute_cy :range
#    alias_native :invert_extent, :invertExtent
#    alias_native :quantiles
    alias_native_new :copy
  end

  class << self
    def scale_quantile
      CY::QuantileScale.new @cy.JS.scaleQuantile
    end
  end
end
