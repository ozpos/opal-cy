module CY
  class StackGenerator
    include CY::Native
  end

  class << self
    def stack
      CY::StackGenerator.new @cy.JS.stack
    end
  end
end
