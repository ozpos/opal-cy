module CY
  class BandScale
    include CY::Native
    def call(t)
      v = @native.call(t)
      `v === undefined ? nil : v`
    end
    attribute_cy :domain
    attribute_cy :range
    alias_native_new :copy
  #  alias_native :bandwidth
 #   alias_native :step
    # this is really weirdo one, as it sets both paddings* but returns inner one
    # All need to be in [0,1] range
    attribute_cy :padding
    attribute_cy :paddingInner
    attribute_cy :paddingOuter
    attribute_cy :align
    attribute_cy :round
    # This requires argument, we might redo this not to
    alias_native_chainable :rangeRound
  end

  class << self
    def scale_band(*args)
      CY::BandScale.new @cy.JS.scaleBand(*args)
    end
  end
end
