module CY
  class Map
    include CY::Native

    def get(key)
      result = @native.JS.get(key)
      `result === undefined ? nil : result`
    end
    include Native
    alias_native_chainable :set
    alias_native_chainable :remove
    alias_native_chainable :clear
    alias_native :keys
    alias_native :values
    alias_native :size
    alias_native :empty?, :empty
    alias_native :has?, :has
    alias_method :[], :get
    alias_method :[]=, :set

    def entries
      @native.JS.entries().map{|o| [`o.key`, `o.value`]}
    end

    def to_h
      `Opal.hash(#{entries})`
    end

    # Should that be reversed to better match ruby and to work with Enumerable?
    # Or just use #to_h if you want ruby interface?
    def each(&block)
      @native.JS.each(block)
      self
    end

    def inspect
      "#<D3::Map: #{ to_h.inspect }>"
    end
  end

  class << self
    def map(object=nil, &block)
      if block_given?
        CY::Map.new(@cy.JS.map(object, proc{|x| yield(x)}))
      elsif object
        CY::Map.new(@cy.JS.map(object))
      else
        CY::Map.new(@cy.JS.map())
      end
    end
  end
end
