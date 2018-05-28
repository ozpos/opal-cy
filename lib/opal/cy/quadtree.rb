module CY
  class Quad
    include CY::Native

    def internal?
      `#@native.constructor === Array`
    end

    def leaf?
      `#@native.constructor !== Array`
    end

    def next
      return nil if internal?
      return nil if `#@native.next == undefined`
      CY::Quad.new(`#@native.next`)
    end

    def data
      return nil if internal?
      `#@native.data`
    end

    def children
      return nil if leaf?
      result = (0..3).map do |i|
        q = `#@native[i]`
        if `q == null`
          nil
        else
          CY::Quad.new(q)
        end
      end
    end
  end

  class QuadTree
    include CY::Native
    alias_native :data
    alias_native :find
    alias_native :size
    alias_native_chainable :add
    alias_native_chainable :addAll
    alias_native_chainable :cover
    alias_native_chainable :remove
    alias_native_chainable :removeAll
    alias_native_new :copy
    attribute_cy :extent

    # visit/visitAfter functions have stupid JS habit of using non-nil return as control
    # and that messes up with languages which have automatic return
    # Maybe worth rewriting to require explicit StopIteration ?
    def visit
      @native.JS.visit(proc do |node, x0, y0, x1, y1|
        yield(CY::Quad.new(node), x0, y0, x1, y1)
      end)
      self
    end

    def visit_after
      @native.JS.visitAfter(proc do |node, x0, y0, x1, y1|
        yield(CY::Quad.new(node), x0, y0, x1, y1)
      end)
      self
    end

    def root
      CY::Quad.new @native.JS.root
    end

    def x(&block)
      if block_given?
        @native.JS.x(block)
        self
      else
        @native.JS.x
      end
    end

    def y(&block)
      if block_given?
        @native.JS.y(block)
        self
      else
        @native.JS.y
      end
    end
  end

  class << self
    def quadtree(*args)
      CY::QuadTree.new @cy.JS.quadtree(*args)
    end
  end
end
