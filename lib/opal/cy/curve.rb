module CY
  class Curve
    include CY::Native
  end

  class CurveBundle < Curve
    alias_native_new :beta
  end

  class CurveCardinal < Curve
    alias_native_new :tension
  end

  class CurveCatmullRom < Curve
    alias_native_new :alpha
  end

  class << self
    def curve_basis
      CY::Curve.new `window.d3.curveBasis`
    end
    def curve_basis_closed
      CY::Curve.new `window.d3.curveBasisClosed`
    end
    def curve_basis_open
      CY::Curve.new `window.d3.curveBasisOpen`
    end
    def curve_bundle
      CY::CurveBundle.new `window.d3.curveBundle`
    end
    def curve_cardinal
      CY::CurveCardinal.new `window.d3.curveCardinal`
    end
    def curve_cardinal_closed
      CY::CurveCardinal.new `window.d3.curveCardinalClosed`
    end
    def curve_cardinal_open
      CY::CurveCardinal.new `window.d3.curveCardinalOpen`
    end
    def curve_catmull_rom
      CY::CurveCatmullRom.new `window.d3.curveCatmullRom`
    end
    def curve_catmull_rom_closed
      CY::CurveCatmullRom.new `window.d3.curveCatmullRomClosed`
    end
    def curve_catmull_rom_open
      CY::CurveCatmullRom.new `window.d3.curveCatmullRomOpen`
    end
    def curve_linear
      CY::Curve.new `window.d3.curveLinear`
    end
    def curve_linear_closed
      CY::Curve.new `window.d3.curveLinearClosed`
    end
    def curve_monotone_x
      CY::Curve.new `window.d3.curveMonotoneX`
    end
    def curve_monotone_y
      CY::Curve.new `window.d3.curveMonotoneY`
    end
    def curve_natural
      CY::Curve.new `window.d3.curveNatural`
    end
    def curve_step
      CY::Curve.new `window.d3.curveStep`
    end
    def curve_step_after
      CY::Curve.new `window.d3.curveStepAfter`
    end
    def curve_step_before
      CY::Curve.new `window.d3.curveStepBefore`
    end
  end
end
