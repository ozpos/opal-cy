module CY
  class EasePoly
    include CY::Native
    alias_native_new :exponent

    def call(t)
      @native.call(t)
    end
  end

  class EaseBack
    include CY::Native
    alias_native_new :overshoot

    def call(t)
      @native.call(t)
    end
  end

  class EaseElastic
    include CY::Native
    alias_native_new :amplitude
    alias_native_new :period

    def call(t)
      @native.call(t)
    end
  end

  class <<self
    def ease_linear(t=nil)
      if t
        @cy.JS.easeLinear(t)
      else
        `#@cy.easeLinear`
      end
    end

    def ease_quad(t=nil)
      if t
        @cy.JS.easeQuad(t)
      else
        `#@cy.easeQuad`
      end
    end

    def ease_quad_in(t=nil)
      if t
        @cy.JS.easeQuadIn(t)
      else
        `#@cy.easeQuadIn`
      end
    end

    def ease_quad_out(t=nil)
      if t
        @cy.JS.easeQuadOut(t)
      else
        `#@cy.easeQuadOut`
      end
    end

    def ease_quad_in_out(t=nil)
      if t
        @cy.JS.easeQuadInOut(t)
      else
        `#@cy.easeQuadInOut`
      end
    end

    def ease_cubic(t=nil)
      if t
        @cy.JS.easeCubic(t)
      else
        `#@cy.easeCubic`
      end
    end

    def ease_cubic_in(t=nil)
      if t
        @cy.JS.easeCubicIn(t)
      else
        `#@cy.easeCubicIn`
      end
    end

    def ease_cubic_out(t=nil)
      if t
        @cy.JS.easeCubicOut(t)
      else
        `#@cy.easeCubicOut`
      end
    end

    def ease_cubic_in_out(t=nil)
      if t
        @cy.JS.easeCubicInOut(t)
      else
        `#@cy.easeCubicInOut`
      end
    end

    def ease_sin(t=nil)
      if t
        @cy.JS.easeSin(t)
      else
        `#@cy.easeSin`
      end
    end

    def ease_sin_in(t=nil)
      if t
        @cy.JS.easeSinIn(t)
      else
        `#@cy.easeSinIn`
      end
    end

    def ease_sin_out(t=nil)
      if t
        @cy.JS.easeSinOut(t)
      else
        `#@cy.easeSinOut`
      end
    end

    def ease_sin_in_out(t=nil)
      if t
        @cy.JS.easeSinInOut(t)
      else
        `#@cy.easeSinInOut`
      end
    end

    def ease_exp(t=nil)
      if t
        @cy.JS.easeExp(t)
      else
        `#@cy.easeExp`
      end
    end

    def ease_exp_in(t=nil)
      if t
        @cy.JS.easeExpIn(t)
      else
        `#@cy.easeExpIn`
      end
    end

    def ease_exp_out(t=nil)
      if t
        @cy.JS.easeExpOut(t)
      else
        `#@cy.easeExpOut`
      end
    end

    def ease_exp_in_out(t=nil)
      if t
        @cy.JS.easeExpInOut(t)
      else
        `#@cy.easeExpInOut`
      end
    end

    def ease_circle(t=nil)
      if t
        @cy.JS.easeCircle(t)
      else
        `#@cy.easeCircle`
      end
    end

    def ease_circle_in(t=nil)
      if t
        @cy.JS.easeCircleIn(t)
      else
        `#@cy.easeCircleIn`
      end
    end

    def ease_circle_out(t=nil)
      if t
        @cy.JS.easeCircleOut(t)
      else
        `#@cy.easeCircleOut`
      end
    end

    def ease_circle_in_out(t=nil)
      if t
        @cy.JS.easeCircleInOut(t)
      else
        `#@cy.easeCircleInOut`
      end
    end

    def ease_bounce(t=nil)
      if t
        @cy.JS.easeBounce(t)
      else
        `#@cy.easeBounce`
      end
    end

    def ease_bounce_in(t=nil)
      if t
        @cy.JS.easeBounceIn(t)
      else
        `#@cy.easeBounceIn`
      end
    end

    def ease_bounce_out(t=nil)
      if t
        @cy.JS.easeBounceOut(t)
      else
        `#@cy.easeBounceOut`
      end
    end

    def ease_bounce_in_out(t=nil)
      if t
        @cy.JS.easeBounceInOut(t)
      else
        `#@cy.easeBounceInOut`
      end
    end

    def ease_poly_in(t=nil)
      if t
        @cy.JS.easePolyIn(t)
      else
        CY::EasePoly.new `#@cy.easePolyIn`
      end
    end

    def ease_poly_out(t=nil)
      if t
        @cy.JS.easePolyOut(t)
      else
        CY::EasePoly.new `#@cy.easePolyOut`
      end
    end

    def ease_poly_in_out(t=nil)
      if t
        @cy.JS.easePolyInOut(t)
      else
        CY::EasePoly.new `#@cy.easePolyInOut`
      end
    end

    def ease_back(t=nil)
      if t
        @cy.JS.easeBack(t)
      else
        CY::EaseBack.new `#@cy.easeBack`
      end
    end

    def ease_back_in(t=nil)
      if t
        @cy.JS.easeBackIn(t)
      else
        CY::EaseBack.new `#@cy.easeBackIn`
      end
    end

    def ease_back_out(t=nil)
      if t
        @cy.JS.easeBackOut(t)
      else
        CY::EaseBack.new `#@cy.easeBackOut`
      end
    end

    def ease_back_in_out(t=nil)
      if t
        @cy.JS.easeBackInOut(t)
      else
        CY::EaseBack.new `#@cy.easeBackInOut`
      end
    end

    def ease_elastic(t=nil)
      if t
        @cy.JS.easeElastic(t)
      else
        CY::EaseElastic.new `#@cy.easeElastic`
      end
    end

    def ease_elastic_in(t=nil)
      if t
        @cy.JS.easeElasticIn(t)
      else
        CY::EaseElastic.new `#@cy.easeElasticIn`
      end
    end

    def ease_elastic_out(t=nil)
      if t
        @cy.JS.easeElasticOut(t)
      else
        CY::EaseElastic.new `#@cy.easeElasticOut`
      end
    end

    def ease_elastic_in_out(t=nil)
      if t
        @cy.JS.easeElasticInOut(t)
      else
        CY::EaseElastic.new `#@cy.easeElasticInOut`
      end
    end
  end
end
