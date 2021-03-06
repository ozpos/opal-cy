# Inspired by freecodecamp project
# This visualization really stretches what opal-D3 can currently comfortably do
# The code will hopefully become nicer in future versions of the gem
require "opal-cy"
require "json"

url = "https://raw.githubusercontent.com/freeCodeCamp/ProjectReferenceData/master/cyclist-data.json"

CY.json(url) do |error, response|
  # This interface could surely be better
  data = JSON.parse(`JSON.stringify(response)`)

  visualization = CY.select("#visualization")
  svg = visualization.append("svg")
  width = svg.style("width").to_i
  height = svg.style("height").to_i
  margin_left = 50
  margin_right = 50
  margin_top = 50
  margin_bottom = 50

  format_ms = proc do |s|
    "%d:%02d" % [(s/60).floor, s%60]
  end

  ydomain = CY.extent(data){|d| d[:Seconds] }
  xdomain = CY.extent(data){|d| d[:Year] }

  xscale = CY.scale_linear
    .domain(xdomain)
    .range([margin_left, width - margin_right])
    .nice
  yscale = CY.scale_linear
    .domain(ydomain)
    .range([height - margin_bottom, margin_top])
    .nice

  xaxis = CY.axis_bottom(xscale).tick_format(&CY.format("d"))
  CY.select("svg").append("g").attr("id", "x-axis")
    .style("transform", "translate(0, #{height - margin_bottom}px)")
    .call(xaxis)

  yaxis = CY.axis_left(yscale).tick_format(&format_ms)
  CY.select("svg").append("g").attr("id", "y-axis")
    .style("transform", "translate(#{margin_left}px, 0)")
    .call(yaxis)

  tooltip = visualization.append("tooltip").attr("id", "tooltip")

  CY.select("svg").select_all("circle")
    .data(data).enter
    .append("circle")
      .attr("class"){|d| d[:Doping] != "" ? "dot doping" : "dot" }
      .attr("cx"){|d| xscale.(d[:Year]) }
      .attr("cy"){|d| yscale.(d[:Seconds]) }
      .attr("r", 3)
      .on("mouseover"){|d|
        tooltip
          .style("display", "block")
          .style("left", "#{xscale.(d[:Year]) + 15}px")
          .style("top", "#{yscale.(d[:Seconds]) - 10}px")
          .html("#{d[:Name]} - #{d[:Nationality]}<br /><a href=#{d[:URL]}>#{d[:Doping]}</a>")
      }
      .on("mouseout"){|d|
        tooltip
          .style("display", "none")
      }

  legend = visualization.append("div").attr("id", "legend")
  legend.append("div").text("Red - doping suspicions")
  legend.append("div").text("Blue - no doping suspicions")
end
