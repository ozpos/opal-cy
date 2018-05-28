module CY
  class SymbolGenerator
    include CY::Native

    def call(*args)
      @native.call(*args)
    end

    attribute_cy_block :size

    def type(new_value=`undefined`, &block)
      if block_given?
        @native.JS.type{|*args| yield(*args).to_n}
        self
      elsif `new_value === undefined`
        CY::SymbolType.new @native.JS.type
      else
        @native.JS.type(new_value.to_n)
        self
      end
    end

    def type=(new_value)
      @native.type(new_value.to_n)
      self
    end
  end

  class SymbolType
    include CY::Native
  end

  class << self
    def symbol
      CY::SymbolGenerator.new @cy.JS.symbol
    end

    def symbols
      `window.d3.symbols`.map{|st| CY::SymbolType.new(st)}
    end

    def symbol_circle
      CY::SymbolType.new `window.d3.symbolCircle`
    end

    def symbol_cross
      CY::SymbolType.new `window.d3.symbolCross`
    end

    def symbol_diamond
      CY::SymbolType.new `window.d3.symbolDiamond`
    end

    def symbol_square
      CY::SymbolType.new `window.d3.symbolSquare`
    end

    def symbol_star
      CY::SymbolType.new `window.d3.symbolStar`
    end

    def symbol_triangle
      CY::SymbolType.new `window.d3.symbolTriangle`
    end

    def symbol_wye
      CY::SymbolType.new `window.d3.symbolWye`
    end
  end
end
