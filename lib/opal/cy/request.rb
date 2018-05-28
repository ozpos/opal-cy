module CY
  class << self
    def csv(url, &callback)
      if callback
        @cy.JS.csv(url, callback)
      else
        @cy.JS.csv(url)
      end
    end

    def html(url, &callback)
      if callback
        @cy.JS.html(url, callback)
      else
        @cy.JS.html(url)
      end
    end

    def json(url, &callback)
      if callback
        @cy.JS.json(url, callback)
      else
        @cy.JS.json(url)
      end
    end

    def text(url, &callback)
      if callback
        @cy.JS.text(url, callback)
      else
        @cy.JS.text(url)
      end
    end

    def tsv(url, &callback)
      if callback
        @cy.JS.tsv(url, callback)
      else
        @cy.JS.tsv(url)
      end
    end

    def xml(url, &callback)
      if callback
        @cy.JS.xml(url, callback)
      else
        @cy.JS.xml(url)
      end
    end
  end
end
