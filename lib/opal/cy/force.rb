module CY
  class ForceSimulation
    include CY::Native

    # Nodes must be native JS objects
    attribute_cy :nodes

    def force(name, value=`undefined`)
      if `value === undefined`
        CY::Force.new @native.JS.force(name)
      else
        @native.JS.force(name, value.to_n)
        self
      end
    end

    def on(name, &callback)
      if callback
        @native.JS.on(name, callback)
        self
      else
        @native.JS.on(name)
      end
    end
  end

  # Due to API structure, just share that
  class Force
    include CY::Native

    attribute_cy_block :id
    attribute_cy_block :strength
    attribute_cy_block :distance
    attribute_cy :links # Must be native objects
    attribute_cy :x
    attribute_cy :y
  end

  class << self
    def force_simulation
      CY::ForceSimulation.new @cy.JS.forceSimulation
    end

    def force_link(*args)
      CY::Force.new @cy.JS.forceLink(*args)
    end

    def force_many_body(*args)
      CY::Force.new @cy.JS.forceManyBody(*args)
    end

    def force_center(*args)
      CY::Force.new @cy.JS.forceCenter(*args)
    end
  end
end