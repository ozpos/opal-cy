module CY
  class Histogram
    include CY::Native

    def call(data)
      @native.call(data)
    end

    def thresholds(count=nil, &block)
      if block_given?
        @native.JS.thresholds(block)
      elsif count.is_a?(Numeric)
        @native.JS.thresholds(count)
      elsif count == :scott
        @native.JS.thresholds{|*args| CY.threshold_scott(*args)}
      elsif count == :sturges
        @native.JS.thresholds{|*args| CY.threshold_sturges(*args)}
      elsif count == :freedman_diaconis
        @native.JS.thresholds{|*args| CY.threshold_freedman_diaconis(*args)}
      else
        raise ArgumentError, "Wrong use of D3::Histogram.thresholds API - pass block, number, or symbol"
      end
      self
    end
  end

  class << self
    def histogram
      CY::Histogram.new @cy.JS.histogram
    end

    def threshold_freedman_diaconis(*args)
      @cy.JS.thresholdFreedmanDiaconis(*args)
    end

    def threshold_scott(*args)
      @cy.JS.thresholdScott(*args)
    end

    def threshold_sturges(*args)
      @cy.JS.thresholdSturges(*args)
    end
  end
end
