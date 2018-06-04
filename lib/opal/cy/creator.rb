module CY
  class Creator
    include CY::Native
  end

  class << self
    def creator(name)
      CY::Creator.new @cy.JS.creator(name)
    end
  end
end
