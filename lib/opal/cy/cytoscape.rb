module CY
  class Cytoscape
    include Native # definately necessarry but do not know why, yet

   def initialize(container:, elements:)
     @native = `cytoscape({container: container, elements: #{elements.to_n}})`  #, style: #{style}, layout: #{layout}});`
    end

    def on(name, selector, &callback)
      if callback
        case name
          when 'click'
            @native.JS.on(name, selector, callback)
        end
        self
      else
        @native.JS.on(name, selector)
      end
    end
  end
end