require "opal-d3"
require "data/force"  # https://bl.ocks.org/rofrischmann

nodes = ForceNodes.map(&:to_n)
links = ForceLinks.map(&:to_n)

svg = D3.select("#visualization")
          .append("svg")
          .attr("height", "600px")
          .attr("width", "950px")

 width = svg.style("width").to_i
 height = svg.style("height").to_i

node_elements = svg.append("g")
            .attr("class", "nodes")
            .select_all("circle")
            .data(nodes)
            .enter().append("circle")
            .attr("r", 10)
            .attr("fill") {|n| `n.level === 1` ? 'red' : 'gray'}  #n.level == 1 ? 'red' : 'blue')

text_elements = svg.append("g")
            .attr("class", "texts")
            .select_all("text")
            .data(nodes)
            .enter().append("text")
            .text{|node| `node.label` }
            .attr("font-size", 15)
            .attr("dx", 15)
            .attr("dy", 4)

link_force = D3
            .force_link
            .id{|link| `link.id` }
            .strength{|link| `link.strength` }


simulation = D3
                 .force_simulation
                 .force("link", link_force)
                 .force("charge", D3.force_many_body.strength(-120))
                 .force("center", D3.force_center(width / 2, height / 2))

simulation.nodes(nodes).on("tick") do
  node_elements
      .attr("cx"){|node| `node.x`}
      .attr("cy"){|node| `node.y`}
  text_elements
      .attr("x"){|node| `node.x`}
      .attr("y"){|node| `node.y`}
end

simulation.force("link").links(links)
