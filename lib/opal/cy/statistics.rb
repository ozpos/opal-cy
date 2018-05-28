module CY
  class << self
    def min(data, &block)
      if block
        @cy.JS.min(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.min(data.compact)
      end
    end

    def max(data, &block)
      if block
        @cy.JS.max(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.max(data.compact)
      end
    end

    def sum(data, &block)
      if block
        @cy.JS.sum(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.sum(data.compact)
      end
    end

    def mean(data, &block)
      result = if block
        @cy.JS.mean(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.mean(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def median(data, &block)
      result = if block
        @cy.JS.median(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.median(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def deviation(data, &block)
      result = if block
        @cy.JS.deviation(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.deviation(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def variance(data, &block)
      result = if block
        @cy.JS.variance(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.variance(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def quantile(data, p, &block)
      result = if block
        @cy.JS.quantile(data, p, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.quantile(data.compact, p)
      end
      `result === undefined ? nil : result`
    end

    def extent(data, &block)
      (a,b) = if block
        @cy.JS.extent(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @cy.JS.extent(data.compact)
      end
      [`a === undefined ? nil : a`, `b === undefined ? nil : b`]
    end
  end
end
