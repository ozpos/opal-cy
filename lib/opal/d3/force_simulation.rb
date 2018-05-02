module D3
  class ForceSimulation
    include D3::Native

    def call(data)
      @native.call(data.to_n)
      self
    end

    #No idea what else I should put here
    def force(name, args)
      if name == "charge"
        self.class.new @d3.JS.forceManyBody().strength(args[0])
      elsif name == "center"
        self.class.new @d3.JS.forceCenter(args[0],args[1])
      elsif name == "link"
        self.class.new @d3.JS.forceLink(args[0])
      end

      def nodes(data)
        self.class.new @d3.JS.nodes(data)

        def on(name, &callback)
          if callback
            @native.JS.on(name, callback)
            self
          else
            @native.JS.on(name)
          end
        end

      end
      def start

      end
#      D3::ForceSimulation
    end

  end

  class << self
    def force_simulation()
      D3::ForceSimulation.new( @d3.JS.forceSimulation())
    end

  end
end
