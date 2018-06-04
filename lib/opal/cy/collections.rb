module CY
  class << self
    alias_d3 :keys
    alias_d3 :values

    def entries(obj)
      @cy.JS.entries(obj).map{|o| [`o.key`, `o.value`]}
    end
  end
end
