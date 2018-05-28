module CY
  class ThresholdScale
    include CY::Native
    attribute_cy :domain
    attribute_cy :range
    alias_native_new :copy

    def call(t)
      @native.call(t)
    end

    def invert_extent(t)
      a,b = @native.JS.invertExtent(t)
      [`a === undefined ? nil : a`, `b === undefined ? nil : b`]
    end
  end

  class << self
    def scale_threshold
      CY::ThresholdScale.new @cy.JS.scaleThreshold
    end
  end
end
