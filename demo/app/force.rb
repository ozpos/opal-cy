require 'opal'
require "opal-d3"

# <!DOCTYPE html>
# <meta charset="utf-8">
#
# <svg width="960" height="600"></svg>
#
# <script src="https://d3js.org/d3.v4.min.js"></script>
# <script>
# var force_nodes = [
#   { id: "mammal", group: 0, label: "Mammals", level: 1 },
#   { id: "dog"   , group: 0, label: "Dogs"   , level: 2 },
#   { id: "cat"   , group: 0, label: "Cats"   , level: 2 },
#   { id: "fox"   , group: 0, label: "Foxes"  , level: 2 },
#   { id: "elk"   , group: 0, label: "Elk"    , level: 2 },
#   { id: "insect", group: 1, label: "Insects", level: 1 },
#   { id: "ant"   , group: 1, label: "Ants"   , level: 2 },
#   { id: "bee"   , group: 1, label: "Bees"   , level: 2 },
#   { id: "fish"  , group: 2, label: "Fish"   , level: 1 },
#   { id: "carp"  , group: 2, label: "Carp"   , level: 2 },
#   { id: "pike"  , group: 2, label: "Pikes"  , level: 2 }
# ]
require "data/force"
# var width = window.innerWidth
# var height = window.innerHeight
#
# var svg = d3.select('svg')
# svg.attr('width', width).attr('height', height)
svg = D3.select("#visualization").append("svg")
svg.attr("height", "600px")
svg.attr("width", "950px")

width = svg.style("width").to_i
height = svg.style("height").to_i
# // simulation setup with all forces
# var linkForce = d3
#   .forceLink()
#   .id(function (link) { return link.id })
#   .strength(function (link) { return link.strength })
getid = proc do |node|
  node.id
end

getstrength = proc do |node|
  node.strength
  end

#linkForce = d3.force_link(ForceLinks)
#                .id(&getid)
#                .strength(&getstrength)

# // simulation setup with all forces
# var simulation = d3
#   .forceSimulation()
#   .force('charge', d3.forceManyBody().strength(-120))
#   .force('center', d3.forceCenter(width / 2, height / 2))
simulation = D3.force_simulation(ForceNodes)
                 .force("charge", -120)
                 .force("center", width/2, height/2)


# function getNodeColor(node) {
#   return node.level === 1 ? 'red' : 'gray'
# }
#
# var nodeElements = svg.append("g")
#   .attr("class", "nodes")
#   .selectAll("circle")
#   .data(nodes)
#   .enter().append("circle")
#     .attr("r", 10)
#     .attr("fill", getNodeColor)
nodeElements = svg.append("g")
                   .selec_all("circle")
    .data(ForceNodes).enter()
     .append("circle")
                   .attr("r", 10)
       .attr("class", "id")
    .attr("fill",'red')
# var textElements = svg.append("g")
#   .attr("class", "texts")
#   .selectAll("text")
#   .data(nodes)
#   .enter().append("text")
#     .text(function (node) { return  node.label })
# 	  .attr("font-size", 15)
# 	  .attr("dx", 15)
#     .attr("dy", 4)
getLabel = proc do |node|
   node.label
end
textElements = svg.append("g")
 .attr("class", "texts")
 .select_all("text")
                   .data(ForceNodes)
      .enter().append("texts")
      .text(&getLabel)
 	  .attr("font-size", 15)
 	  .attr("dx", 15)
     .attr("dy", 4)

#   simulation.nodes(nodes).on('tick', () => {
#     nodeElements
#       .attr('cx', function (node) { return node.x })
#       .attr('cy', function (node) { return node.y })
#     textElements
#       .attr('x', function (node) { return node.x })
#       .attr('y', function (node) { return node.y })
#   })


simulation.nodes(nodes).on("tick") {|n|
     nodeElements
     .attr("cx", n.x )
       .attr("cy", n.y )
     textElements
       .attr("x", n.x )
       .attr("y", n.y )
}
simulation.start

#x = D3.scale_linear.domain([0, ForceNodes.size-1]).range([40, width-20])
#y = D3.scale_linear.domain(ForceNodes.map(&:rating).minmax).range([550, 50])
#c = D3.scale_ordinal.range(D3.scheme_category_10)

#(1..7).each do |season|
#  episodes = ForceNodes.select{|episode| episode.season == season }
#  avg = D3.mean(episodes.map(&:rating))
#  svg.append("line")
#    .attr("x1", x.(episodes.map(&:number).min))
#    .attr("x2", x.(episodes.map(&:number).max))
#    .attr("y1", y.(avg))
#    .attr("y2", y.(avg))
#    .attr("stroke", c.(season))
#    .attr("stroke-width", 2)
#    .attr("opacity", 0.4)
#end

#ForceNodes.each do |episode|
#  svg.append("circle")
#    .attr("cx", x.(episode.number))
#    .attr("cy", y.(episode.rating))
#    .attr("r", 4)
#    .attr("fill", c.(episode.season))
#    .attr("opacity", 0.6)
#    .append("title")
#      .text("S%02dE%02d %s" % [episode.season, episode.number, episode.title])
#end

#axis = D3.axis_left(y)
#svg.append("g").attr("transform","translate(30, 0)")
#  .call(axis)
