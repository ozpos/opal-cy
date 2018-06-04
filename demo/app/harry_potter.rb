require "opal-cy"
require "data/harry_potter"

svg = CY.select("#visualization")
  .append("svg")
  .attr("height", "400px")
  .attr("width", "100%")
width = svg.style("width").to_i

bar_size = (400-40-20) / (HarryPotterBooks.size)

x = CY.scale_linear.domain(HarryPotterBooks.map(&:date).minmax).range([200, width-90])
y = CY.scale_ordinal.range(HarryPotterBooks.size.times.map{|i| 40+i*bar_size}.reverse)
s = CY.scale_sqrt.domain([0, HarryPotterBooks.map(&:pages).max]).range([0, 50])

HarryPotterBooks.each do |book|
  svg.append("text")
    .attr("x", x.(book.date))
    .attr("y", y.(book.title) + bar_size/2)
    .attr("font-size", s.(book.pages))
    .text("📖")
    .attr("text-anchor", "middle")
    .append("title")
      .text("#{book.pages} pages")
  svg.append("text")
    .attr("x", 0)
    .attr("y", y.(book.title) + bar_size/2)
    .text(book.title)
end

axis_bottom = CY.axis_bottom(x)
  .tick_format(CY.time_format("%Y-%m-%d"))
  .tick_values(HarryPotterBooks.map(&:date))
svg.append("g")
  .attr("transform", "translate(0, 380)")
  .call(axis_bottom)
