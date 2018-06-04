module CY
  class Set
    include CY::Native
 #   alias_native :empty?, :empty
 #   alias_native :has?, :has
 #   alias_native :size
 #   alias_native :values
    alias_native_chainable :add
    alias_native_chainable :clear
    alias_native_chainable :remove

    def each(&block)
      @native.JS.each(block)
      self
    end

    def inspect
      "#<D3::Set: {#{ values.join(", ") }}>"
    end
  end

  class << self
    def set(array=nil, &block)
      if block_given?
        CY::Set.new @cy.JS.set(array, proc{|x| yield(x)})
      elsif array
        CY::Set.new @cy.JS.set(array)
      else
        CY::Set.new @cy.JS.set()
      end
    end
  end
end
