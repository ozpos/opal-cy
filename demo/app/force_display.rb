require "opal-cy"
require "data/force"  # https://bl.ocks.org/rofrischmann

myelements = [
    { data: { id: 'a' } },
    { data: { id: 'b' } },
    { data: { id: 'c' } },
    { data: { id: 'ab', source: 'a', target: 'b' } },
    { data: { id: 'bc', source: 'b', target: 'c' } },
    { data: { id: 'ca', source: 'c', target: 'a' } }]
               # do in class.map(&:to_n)

style = [{style: {'background-color': '#a66',
                  'target-arrow-color': '#ccc'
}}].map(&:to_n)   # does not work without map
# The styles below do not work.  If a node cannot be selected then it means a style is wrong.
#                                    'label': 'data(id)'}},
#         {selector: 'edge', style: {'width': 3,
#                                    'label': 'data(id)',#

#                                    'line-color': '#ccc'
#                                    'target-arrow-color': '#ccc',
#                                    'target-arrow-shape': 'triangle'
#                                    }}].map(&:to_n)   # does not work without map
#layout = {name: 'grid', rows: 2}
layout = {name: 'grid', rows: 1}.map(&:to_n)

#cycy = CY::Cytoscape.new({ container: `document.getElementById('cycy')`, elements: elements, style: style, layout: layout})
cycy = CY::Cytoscape.new( container: `document.getElementById('cycy')`, elements: myelements )
#cycy.layout.run # does not seem to do anything
# js -> cycy.on('click', 'node', function(evt){  console.log( 'clicked ' + this.id() );

myEvt = proc do |evt|
  `console.log( 'clicked ' + this.id() + #{evt} );`
end

cycy.on("click", "node", &myEvt)
# d3 node_elements context calling example
#    .on("click"){|n|
#      tooltip
#          .style("background-color", "black")
#    }

nodes = ForceNodes.map(&:to_n)
links = ForceLinks.map(&:to_n)


svg = CY.select("#visualization")
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

link_force = CY
            .force_link
            .id{|link| `link.id` }
            .strength{|link| `link.strength` }


simulation = CY
                 .force_simulation
                 .force("link", link_force)
                 .force("charge", CY.force_many_body.strength(-120))
                 .force("center", CY.force_center(width / 2, height / 2))

simulation.nodes(nodes).on("tick") do
  node_elements
      .attr("cx"){|node| `node.x`}
      .attr("cy"){|node| `node.y`}
  text_elements
      .attr("x"){|node| `node.x`}
      .attr("y"){|node| `node.y`}
end

simulation.force("link").links(links)
