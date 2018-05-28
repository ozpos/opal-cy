module CY
  # It might be better to rewrap the Scale every time, as we're duplicating it
  class Axis
    include CY::Native

    def initialize(native, scale_obj)
      raise unless native
      raise unless scale_obj
      @scale_obj = scale_obj
      @native = native
    end

    attribute_cy :tickSizeInner
    attribute_cy :tickSizeOuter
    attribute_cy :tickSize
    attribute_cy :tickPadding
    attribute_cy :tickArguments
    alias_native_chainable :ticks

    def call(context)
      @native.call(context.to_n)
      self
    end

    def scale(v=`undefined`)
      if `v === undefined`
        @scale_obj
      else
        @scale_obj = v
        @native.JS.scale(v.to_n)
        self
      end
    end
    alias_method :scale=, :scale

    def tick_values(v=`undefined`)
      if `v === undefined`
        result = @native.JS.tickValues
        `result === null ? nil : result`
      else
        @native.JS.tickValues(v == nil ? `null` : v)
        self
      end
    end
    alias_method :tick_values=, :tick_values

    def tick_format(v=`undefined`, &block)
      v = block if block_given?
      if `v === undefined`
        result = @native.JS.tickFormat
        `result === null ? nil : result`
      else
        @native.JS.tickFormat(v == nil ? `null` : v)
        self
      end
    end
    alias_method :tick_format=, :tick_format
  end

  class << self
    def axis_top(scale)
      CY::Axis.new(@cy.JS.axisTop(scale.to_n), scale)
    end

    def axis_bottom(scale)
      CY::Axis.new(@cy.JS.axisBottom(scale.to_n), scale)
    end

    def axis_right(scale)
      CY::Axis.new(@cy.JS.axisRight(scale.to_n), scale)
    end

    def axis_left(scale)
      CY::Axis.new(@cy.JS.axisLeft(scale.to_n), scale)
    end
  end
end
