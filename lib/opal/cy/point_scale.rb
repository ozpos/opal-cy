module CY
  class PointScale
    include CY::Native

    def call(t)
      v = @native.call(t)
      `v === undefined ? nil : v`
    end
    attribute_cy :domain
    attribute_cy :range
    alias_native_new :copy
#    alias_native :bandwidth
#    alias_native :step
    attribute_cy :padding
    attribute_cy :align
    attribute_cy :round
    # This requires argument, we might redo this not to
    alias_native_chainable :rangeRound
  end

  class << self
    def scale_point
      CY::PointScale.new @cy.JS.scalePoint
    end
  end
end
