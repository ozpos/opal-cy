module CY
  class SequentialScale
    include CY::Native

    def call(t)
      @native.call(t)
    end

    attribute_cy :domain
    attribute_cy :clamp

    def copy
      self.class.new @native.JS.copy
    end

    def interpolator(&block)
      if block_given?
        @native.JS.interpolator(block)
        self
      else
        @native.JS.interpolator
      end
    end
  end

  class << self
    def scale_sequential(&block)
      raise unless block_given?
      SequentialScale.new @cy.JS.scaleSequential(block)
    end

    def interpolate_viridis(t=nil)
      if t
        @cy.JS.interpolateViridis(t)
      else
        `#@cy.interpolateViridis`
      end
    end

    def interpolate_inferno(t=nil)
      if t
        @cy.JS.interpolateInferno(t)
      else
        `#@cy.interpolateInferno`
      end
    end

    def interpolate_magma(t=nil)
      if t
        @cy.JS.interpolateMagma(t)
      else
        `#@cy.interpolateMagma`
      end
    end

    def interpolate_plasma(t=nil)
      if t
        @cy.JS.interpolatePlasma(t)
      else
        `#@cy.interpolatePlasma`
      end
    end

    def interpolate_warm(t=nil)
      if t
        @cy.JS.interpolateWarm(t)
      else
        `#@cy.interpolateWarm`
      end
    end

    def interpolate_cool(t=nil)
      if t
        @cy.JS.interpolateCool(t)
      else
        `#@cy.interpolateCool`
      end
    end

    def interpolate_rainbow(t=nil)
      if t
        @cy.JS.interpolateRainbow(t)
      else
        `#@cy.interpolateRainbow`
      end
    end

    def interpolate_cubehelix_default(t=nil)
      if t
        @cy.JS.interpolateCubehelixDefault(t)
      else
        `#@cy.interpolateCubehelixDefault`
      end
    end
  end
end
