module D3
  class << self
    # This could maybe use more OO interface in addition to this?
    # Like D3::Polygon.new(points).area etc.

    alias_d3 :polygonArea # signed area
    alias_d3 :polygonCentroid
    alias_d3 :polygon_contains?, :polygonContains
    alias_d3 :polygonLength

    def polygon_hull(points)
      hull = @d3.JS.polygonHull(points)
      `hull === null ? nil : hull`
    end
  end
end
