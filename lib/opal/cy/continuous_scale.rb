module CY
  class ContinuousScale
    include CY::Native
    def call(t)
      @native.call(t)
    end

    alias_native :invert
    attribute_cy :domain
    attribute_cy :range
    attribute_cy :clamp
    alias_native_chainable :nice
    alias_native_new :copy
    alias_native :ticks
    alias_native :tick_format, :tickFormat
    alias_native_chainable :rangeRound
    def interpolate(&block)
      if block
        @native.JS.interpolate(block)
        self
      else
        @native.JS.interpolate
      end
    end
  end

  class PowScale < ContinuousScale
    attribute_cy :exponent
  end

  class LogScale < ContinuousScale
    attribute_cy :base
  end

  class << self
    def scale_pow
      CY::PowScale.new @cy.JS.scalePow
    end

    def scale_sqrt
      CY::PowScale.new @cy.JS.scaleSqrt
    end

    def scale_linear
      CY::ContinuousScale.new @cy.JS.scaleLinear
    end

    def scale_log
      CY::LogScale.new @cy.JS.scaleLog
    end

    def scale_identity
      CY::ContinuousScale.new @cy.JS.scaleIdentity
    end

    def scale_time
      CY::ContinuousScale.new @cy.JS.scaleTime
    end

    def scale_utc
      CY::ContinuousScale.new @cy.JS.scaleUtc
    end
  end
end
