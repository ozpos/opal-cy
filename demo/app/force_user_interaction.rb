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

tooltip = visualization.append("div").attr("id", "tooltip")
              .style("opacity", 0)

link_elements = svg.append("g")
                    .attr("class", "links")
                    .select_all("line")
                    .data(links)
                    .enter().append("line")
                    .attr("stroke-width", 3)
                    .attr("stroke", "rgba(50, 50, 50, 0.2)")
link_force = D3
                 .force_link
                 .id{|link| `link.id` }
                 .strength{|link| `link.strength` }


simulation = D3
                 .force_simulation
                 .force("link", link_force)
                 .force("charge", D3.force_many_body.strength(-120))
                 .force("center", D3.force_center(width / 2, height / 2))


node_elements = svg.append("g")
                    .attr("class", "nodes")
                    .select_all("circle")
                    .data(nodes).enter
                    .append("circle").attr("id","circle")
                    .attr("r", 10)
                    .attr("fill") {|n| `n.level === 1` ? 'red' : 'gray'}  #n.level == 1 ? 'red' : 'blue')
                    .on("mouseover"){|n|
                      tooltip
                          .style("opacity", 0.8)
                          .html("Group #{`n.group`} #{`n.label`}")
                          .style("left", "#{`n.x`+10}px")
                          .style("top", "#{`n.y` +10}px")
# or the following works
#                  .style("left", "#{`d3.event.pageX`+10}px")
#                  .style("top", "#{`d3.event.pageY` - 28}px")
                    }
                    .on("mouseout"){
                      # This could use .transition.duration(500), but opal-d3 doesn't support that yet
                      tooltip
                          .style("opacity", 0)
                          .style("background-color", "white")
                    }
                    .on("click"){|n|
                      tooltip
                          .style("background-color", "black")
                    }
                    .on("start"){|n|
                      n
                          .attr("fx"){|n| `n.x`}
                          .attr("fy"){|n| `n.y`}
                    }
 .on('drag'){|n|
  `simulation.alphaTarget(0.7).restart()`
  `n.fx = d3.event.x`
  `n.fy = d3.event.y`
}

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

#var dragDrop = d3.drag()
# .on('start', function (node) {
#  node.fx = node.x
#  node.fy = node.y
#})
# .on('drag', function (node) {
#  simulation.alphaTarget(0.7).restart()
#  node.fx = d3.event.x
#  node.fy = d3.event.y
#})
# .on('end', function (node) {
#  if (!d3.event.active) {
#      simulation.alphaTarget(0)
#  }
#  node.fx = null
#  node.fy = null
#  })
move = proc do
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
simulation.nodes(nodes).on("tick") do
  move.call
#  node_elements
#      .attr("cx"){|node| `node.x`}
#      .attr("cy"){|node| `node.y`}
#  text_elements
#      .attr("x"){|node| `node.x`}
#      .attr("y"){|node| `node.y`}
#  link_elements
#      .attr("x1"){|link| `link.source.x` }
#      .attr("y1"){|link| `link.source.y` }
#      .attr("x2"){|link| `link.target.x` }
#      .attr("y2"){|link| `link.target.y` }
end

simulation.force("link").links(links)
