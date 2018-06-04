# all these methods return indexes not values
module CY
  class Bisector
    include CY::Native
#    alias_native :left
#    alias_native :right
  end

  class << self
    alias_d3 :ascending
    alias_d3 :descending
    alias_d3 :bisect
    alias_d3 :bisectLeft
    alias_d3 :bisectRight

    def scan(array, &block)
      if block_given?
        @cy.JS.scan(array, block)
      else
        @cy.JS.scan(array)
      end
    end

    def bisector(&block)
      CY::Bisector.new @cy.JS.bisector(block)
    end
  end
end
