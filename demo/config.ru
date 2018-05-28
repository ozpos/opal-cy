require "bundler"
Bundler.require
gem "sinatra"
require "sinatra"

opal = Opal::Server.new do |s|
  s.append_path "/home/john/RubymineProjects/web/opal-cy/demo/app"
  s.append_path "/home/john/RubymineProjects/web/opal-cy/demo/assets"
end

map "/assets" do
  run opal.sprockets
end

visualizations = {
    sandbox: "Anything",
    force_display: "Force: Display Nodes",
    force_relations: "Force: Node Relations",
    force_user_interaction: "Force: User Interaction",
  elections_2016: "Elections 2016",
	london_population: "London Population",
	london_population_area: "London Population - Area Chart",
	olympics_2016_medals: "Olympics 2016 Medals",
  iphones: "iPhones",
  polish_pms: "Polish Prime Ministers",
  man_vs_horse: "Man versus Horse Marathon",
  paradox: "Paradox Interactive Games",
  weather_in_london: "Weather in London",
  harry_potter: "Harry Potter Books",
  mtg_modern_creatures: "MTG: Creatures in Modern",
  mtg_modern_colors: "MTG: Spell Cards in Modern",
  star_trek_voyager: "Star Trek: Voyager",
  us_gdp: "US GDP",
  cycling: "Doping in Professional Bicycle Racing",
  temperature: "Historical Temperature Record",
  eu_force_graph: "EU Countries Force Graph"
}

visualizations.each do |script, title|
  get "/v/#{script}.html" do
    erb :visualization, {}, {script: script, title: title}
  end
end

get "/" do
  erb :index, {}, {visualizations: visualizations}
end

run Sinatra::Application
