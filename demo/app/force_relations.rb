require "opal-d3"
require "data/force"  # ForceNodes[{}]

nodes = ForceNodes.map(&:to_n)
links = ForceLinks.map(&:to_n)

visualization = D3.select("#visualization")
svg = visualization.append("svg")
          .attr("height", "600px")
          .attr("width", "950px")

width = svg.style("width").to_i
height = svg.style("height").to_i

link_elements = svg.append("g")
            .attr("class", "links")
            .select_all("line")
            .data(links)
            .enter().append("line")
            .attr("stroke-width", 3)
            .attr("stroke", "rgba(50, 50, 50, 0.2)")

node_elements = svg.append("g")
            .attr("class", "nodes")
            .select_all("circle")
            .data(nodes).enter
            .append("circle")
            .attr("r", 10)
            .attr("fill") {|n| `n.level === 1` ? 'red' : 'gray'}  #n.level == 1 ? 'red' : 'blue')

text_elements = svg.append("g")
            .attr("class", "texts")
            .select_all("text")
            .data(nodes)
            .enter().append("text")
            .attr("id","text")
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
  link_elements
      .attr("x1"){|link| `link.source.x` }
      .attr("y1"){|link| `link.source.y` }
      .attr("x2"){|link| `link.target.x` }
      .attr("y2"){|link| `link.target.y` }
end

simulation.force("link").links(links)
