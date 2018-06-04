module CY
  class QuantizeScale
    include CY::Native

    def call(t)
      @native.call(t)
    end

    attribute_cy :domain
    attribute_cy :range
 #   alias_native :invert_extent, :invertExtent
 #   alias_native :ticks
 #   alias_native :tick_format, :tickFormat
    alias_native_chainable :nice
    alias_native_new :copy
  end

  class << self
    def scale_quantize
      CY::QuantizeScale.new @cy.JS.scaleQuantize
    end
  end
end
