module D3
  class ForceLink
    include D3::Native

    def call(data)
      @native.call(data.to_n)
      self
    end

    #No idea what else I should put here
#      D3::ForceSimulation
    def id(&link)
      link
    end
    def strength(&link)
      link
    end

    def links(data)
      self.class.new @d3.JS.links(data)

#      def on(name, &callback)
#        if callback
#          @native.JS.on(name, callback)
#          self
#        else
#          @native.JS.on(name)
#        end
#     end

    end


  end

  class << self
    def force_link
      D3::ForceLink.new( @d3.JS.forceLink())
    end

  end
end
