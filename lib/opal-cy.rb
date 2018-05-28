require "opal"
if RUBY_ENGINE == "opal"
  require "active_support/core_ext/string"
  require_relative "opal/cy"
else
  require "opal-activesupport"
  require_relative "opal/cy/version"

  # This seems to be needed by sprockets somehow
  Opal.append_path __dir__.untaint
end
