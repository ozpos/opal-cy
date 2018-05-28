module CY
  class << self
    def interpolate_number(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateNumber`
      else
        @cy.JS.interpolateNumber(a, b)
      end
    end

    def interpolate_round(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateRound`
      else
        @cy.JS.interpolateRound(a, b)
      end
    end

    def interpolate_string(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateString`
      else
        @cy.JS.interpolateString(a, b)
      end
    end

    def interpolate_array(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateArray`
      else
        @cy.JS.interpolateArray(a, b)
      end
    end

    def interpolate_date(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateDate`
      else
        @cy.JS.interpolateDate(a, b)
      end
    end

    # These should support gamma
    def interpolate_rgb(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateRgb`
      else
        @cy.JS.interpolateRgb(a, b)
      end
    end

    def interpolate_rgb_basis(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateRgbBasis`
      else
        @cy.JS.interpolateRgbBasis(a, b)
      end
    end

    def interpolate_rgb_basis_closed(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateRgbBasisClosed`
      else
        @cy.JS.interpolateRgbBasisClosed(a, b)
      end
    end

    def interpolate_hsl(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateHsl`
      else
        @cy.JS.interpolateHsl(a, b)
      end
    end

    def interpolate_hsl_long(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateHslLong`
      else
        @cy.JS.interpolateHslLong(a, b)
      end
    end

    def interpolate_lab(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateLab`
      else
        @cy.JS.interpolateLab(a, b)
      end
    end

    def interpolate_hcl(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateHcl`
      else
        @cy.JS.interpolateHcl(a, b)
      end
    end

    def interpolate_hcl_long(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateHclLong`
      else
        @cy.JS.interpolateHclLong(a, b)
      end
    end

    def interpolate_cubehelix(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateCubehelix`
      else
        @cy.JS.interpolateCubehelix(a, b)
      end
    end

    def interpolate_cubehelix_long(a=nil,b=nil)
      if a == nil and b == nil
        `#@cy.interpolateCubehelixLong`
      else
        @cy.JS.interpolateCubehelixLong(a, b)
      end
    end

  end
end
