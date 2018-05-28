module CY
  class Cytoscape
# seems like it is not needed
include Native

 #   attribute_cy :container
 #   attribute_cy :elements

# this works
  def initialize (arg_hash = {})
      container = arg_hash[:container]
      elements  = arg_hash[:elements]
      style     = arg_hash[:style]
      layout    = arg_hash[:layout]
      zoom      = arg_hash[:zoom]
      pan       = arg_hash[:pan]

# This does not    def initialize(container:, elements:)
#      @native = `cytoscape(container, elements)`#`.to_n)`

 #     args = container
#      @native = `cytoscape(:container document.getElementById(#{container}), :elements #{elements})`
#      @native = `cytoscape(container: #{container}, elements: #{elements})`
#      @native = `cytoscape(document.getElementById(#{container}), #{elements})`
#      @native = `new cytoscape(document.getElementById(#{container}))`
#      @native = `new cytoscape({container: #{container},elements: #{elements}})`

# This works
     @native = `cytoscape({container: #{container},elements: #{elements}, style: #{style}, layout: #{layout}});`
    end

    alias_native :container
    alias_native :elements
    alias_native :style
    alias_native :wheelSensitivity
    alias_native :layout
    alias_native :add
    alias_native :run

    def cyon(name, selector, &callback)
      if callback
        @native.JS.on(name, selector, callback)
        self
      else
        @native.JS.on(name, selector)
      end
    end

   @native
   #self
  end
end