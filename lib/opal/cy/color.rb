module CY
  class Color
    include CY::Native
    attr_reader :native
    alias_native :to_s, :toString
    alias_native_new :brighter
    alias_native_new :darker
#    alias_native :displayable?, :displayable
    alias_native_new :rgb

    # Various subsets of these are valid depending on color - maybe we should properly subclass?
    def a; `#@native.a` end
    def b; `#@native.b` end
    def c; `#@native.c` end
    def g; `#@native.g` end
    def h; `#@native.h` end
    def l; `#@native.l` end
    def r; `#@native.r` end
    def s; `#@native.s` end
    def opacity; `#@native.opacity` end
  end

  class <<self
    def color(description)
      color = @cy.JS.color(description)
      if color
        CY::Color.new(color)
      else
        raise ArgumentError, "Invalid color: #{description}"
      end
    end

    def rgb(*args)
      color = if args[0].is_a?(Color)
        @cy.JS.rgb(args[0].native)
      else
        @cy.JS.rgb(*args)
      end
      CY::Color.new(color)
    end

    def hsl(*args)
      color = if args[0].is_a?(Color)
        @cy.JS.hsl(args[0].native)
      else
        @cy.JS.hsl(*args)
      end
      CY::Color.new(color)
    end

    def lab(*args)
      color = if args[0].is_a?(Color)
        @cy.JS.lab(args[0].native)
      else
        @cy.JS.lab(*args)
      end
      CY::Color.new(color)
    end

    def hcl(*args)
      color = if args[0].is_a?(Color)
        @cy.JS.hcl(args[0].native)
      else
        @cy.JS.hcl(*args)
      end
      CY::Color.new(color)
    end

    def cubehelix(*args)
      color = if args[0].is_a?(Color)
        @cy.JS.cubehelix(args[0].native)
      else
        @cy.JS.cubehelix(*args)
      end
      CY::Color.new(color)
    end
  end
end
