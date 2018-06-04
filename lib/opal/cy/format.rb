module CY
  class FormatSpecifier
    include CY::Native

    FIELDS = %W[fill align sign symbol zero width comma precision type]
    FIELDS.each do |key|
      define_method(key) {
        `v = #@native[key]`
        `v === undefined ? nil : v`
      }
      define_method("#{key}=") {|v|
        `#@native[key] = (v === nil ? undefined : v)`
      }
    end

    def to_h
      result = {}
      FIELDS.each do |key|
        result[key] = send(key)
      end
      result
    end

    def to_n
      @native
    end
  end

  class FormatLocale
    include CY::Native

    def format(specifier)
      if specifier.is_a?(FormatSpecifier)
        @native.JS.format(specifier.to_n)
      else
        @native.JS.format(specifier)
      end
    end

    def format_prefix(specifier, value)
      if specifier.is_a?(FormatSpecifier)
        @native.JS.formatPrefix(specifier.to_n, value)
      else
        @native.JS.formatPrefix(specifier, value)
      end
    end
  end


  class << self
    alias_d3 :precisionFixed
    alias_d3 :precisionPrefix
    alias_d3 :precisionRound

    def format(specifier)
      if specifier.is_a?(FormatSpecifier)
        @cy.JS.format(specifier.to_n)
      else
        @cy.JS.format(specifier)
      end
    end

    def format_prefix(specifier, value)
      if specifier.is_a?(FormatSpecifier)
        @cy.JS.formatPrefix(specifier.to_n, value)
      else
        @cy.JS.formatPrefix(specifier, value)
      end
    end

    def format_specifier(specifier)
      CY::FormatSpecifier.new @cy.JS.formatSpecifier(specifier)
    end

    def format_locale(spec={})
      CY::FormatLocale.new @cy.JS.formatLocale(
        {
          decimal: spec.fetch("decimal", "."),
          thousands: spec.fetch("thousands", ","),
          grouping: spec.fetch("grouping", [3]),
          currency: spec.fetch("currency", ["$", ""]),
        }.to_n
      )
    end

    def format_default_locale(spec={})
      CY::FormatLocale.new @cy.JS.formatDefaultLocale(
        {
          decimal: spec.fetch("decimal", "."),
          thousands: spec.fetch("thousands", ","),
          grouping: spec.fetch("grouping", [3]),
          currency: spec.fetch("currency", ["$", ""]),
        }.to_n
      )
    end
  end
end
