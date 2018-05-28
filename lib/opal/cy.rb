require "opal"

class Module
  def alias_d3(ruby_name=nil, js_name)
    ruby_name ||= js_name.underscore
    define_method(ruby_name) do |*args|
      @cy.JS[js_name].JS.apply(@cy, `Opal.to_a(args)`)
    end
  end
end

module CY
  @cy = `window.d3`
 # @cycy = `window.cyto`
  @cyt = `document.getElementById('cyt')`
  class << self
  end
end
# Metaclass:
require_relative "cy/native"

# Everything else:
require_relative "cy/cytoscape"
require_relative "cy/arc"
require_relative "cy/area"
require_relative "cy/axis"
require_relative "cy/band_scale"
require_relative "cy/collections"
require_relative "cy/color"
require_relative "cy/continuous_scale"
require_relative "cy/creator"
require_relative "cy/curve"
require_relative "cy/dsv"
require_relative "cy/ease"
require_relative "cy/force"
require_relative "cy/format"
require_relative "cy/histograms"
require_relative "cy/interpolate"
require_relative "cy/line"
require_relative "cy/map"
require_relative "cy/misc"
require_relative "cy/nest"
require_relative "cy/ordinal_scale"
require_relative "cy/path"
require_relative "cy/pie"
require_relative "cy/point_scale"
require_relative "cy/polygon"
require_relative "cy/quadtree"
require_relative "cy/quantile_scale"
require_relative "cy/quantize_scale"
require_relative "cy/radial_area"
require_relative "cy/radial_line"
require_relative "cy/random"
require_relative "cy/request"
require_relative "cy/search"
require_relative "cy/selection"
require_relative "cy/sequential_scale"
require_relative "cy/set"
require_relative "cy/stack"
require_relative "cy/statistics"
require_relative "cy/symbol"
require_relative "cy/threshold_scale"
require_relative "cy/time_format"
require_relative "cy/time_interval"
require_relative "cy/transformations"
