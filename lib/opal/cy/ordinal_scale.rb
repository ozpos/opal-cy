module CY
  class OrdinalScale
    include CY::Native

    def call(t)
      @native.call(t)
    end
    attribute_cy :domain
    attribute_cy :range
    alias_native_new :copy

    # D3 is trying to reinvent Ruby symbols here
    def unknown(new_value=nil)
      if new_value == nil
        v = @native.JS.unknown
        if `JSON.stringify(v) === '{"name":"implicit"}'`
          :implicit
        else
          v
        end
      else
        if new_value == :implicit
          new_value = `window.d3.scaleImplicit`
        end
        @native.JS.unknown(new_value)
        self
      end
    end
  end

  class << self
    def scale_ordinal(*args)
      CY::OrdinalScale.new @cy.JS.scaleOrdinal(*args)
    end

    def scale_implicit
      :implicit
    end

    def scheme_category_10
      `window.d3.schemeCategory10`
    end

    def scheme_category_20
      `window.d3.schemeCategory20`
    end

    def scheme_category_20b
      `window.d3.schemeCategory20b`
    end

    def scheme_category_20c
      `window.d3.schemeCategory20c`
    end
  end
end
