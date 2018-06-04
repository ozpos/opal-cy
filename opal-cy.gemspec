require_relative "lib/opal/cy/version"

Gem::Specification.new do |s|
  s.name         = "opal-cy"
  s.version      = Opal::CY::VERSION
  s.author       = "John Leake"
  s.email        = "jleake@socit.co.uk"
  s.homepage     = "https://github.com/ozpos/opal-d3"
  s.summary      = "Ruby bindings for Cytospace.js"
  s.description  = "Opal wrapper library for Cytospace.js library"

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ["lib"]

  s.add_runtime_dependency "opal", "~> 0.11.0"
  s.add_runtime_dependency "opal-activesupport", "~> 0.3.1"
  s.add_development_dependency "opal-rspec", ">= 0.6.0"
  s.add_development_dependency "rake", ">= 11.3.0"
end
