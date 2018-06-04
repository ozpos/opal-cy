require 'console'
require 'native'

module CY
  class Cytoscape
    include Native # definately necessarry but do not know why, yet

   def initialize(container:, elements:)
     @native = `cytoscape({container: container, elements: #{elements.to_n}})`  #, style: #{style}, layout: #{layout}});`
    end

# Following works
#    def on(name, selector, &callback)
#      if callback
#        case name
#          when 'click'
#            @native.JS.on(name, selector, callback)
#        end
#        self
#      else
#        @native.JS.on(name, selector)
#      end
#    end
# following fails
    def on(name, selector, &block)
      %x{
      #{@native}.on(name, selector, function(event) {
          return #{block.call(Native(`this`), Native(`event`))};
        });
      }
    end

  end
end