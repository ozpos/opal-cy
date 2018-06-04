module CY
  class Path
    include CY::Native

    # D3 methods aren't chainable, but there's no reason why they shouldn't be
    alias_native_chainable :moveTo
    alias_native_chainable :closePath
    alias_native_chainable :lineTo
    alias_native_chainable :quadraticCurveTo
    alias_native_chainable :bezierCurveTo
    alias_native_chainable :arcTo
    alias_native_chainable :arc
    alias_native_chainable :rect
    alias_native :to_s, :toString
  end

  class << self
    def path
      CY::Path.new @cy.JS.path
    end
  end
end
