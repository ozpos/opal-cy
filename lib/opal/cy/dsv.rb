module CY
  class DsvFormat
    include CY::Native

    def parse_rows(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @native.JS.parseRows(string, proc{|d|
          result = row.call(d)
          result == nil ? `null` : result
        })
      else
        @native.JS.parseRows(string)
      end
    end

    def parse(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @native.JS.parse(string, proc{|e|
          result = row.call(`Opal.hash(e)`)
          result == nil ? `null` : result
        })
      else
        @native.JS.parse(string).map{|e| `Opal.hash(e)` }
      end
    end

    alias_native :format_rows, :formatRows

    alias_native :format
  end

  class << self
    def dsv_format(separator)
      CY::DsvFormat.new @cy.JS.dsvFormat(separator)
    end

    def csv_parse_rows(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @cy.JS.csvParseRows(string, proc{|d|
          result = row.call(d)
          result == nil ? `null` : result
        })
      else
        @cy.JS.csvParseRows(string)
      end
    end

    def tsv_parse_rows(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @cy.JS.tsvParseRows(string, proc{|d|
          result = row.call(d)
          result == nil ? `null` : result
        })
      else
        @cy.JS.tsvParseRows(string)
      end
    end

    def csv_format_rows(rows)
      @cy.JS.csvFormatRows(rows)
    end

    def tsv_format_rows(rows)
      @cy.JS.tsvFormatRows(rows)
    end

    def csv_parse(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @cy.JS.csvParse(string, proc{|e|
          result = row.call(`Opal.hash(e)`)
          result == nil ? `null` : result
        })
      else
        @cy.JS.csvParse(string).map{|e| `Opal.hash(e)` }
      end
    end

    def tsv_parse(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @cy.JS.tsvParse(string, proc{|e|
          result = row.call(`Opal.hash(e)`)
          result == nil ? `null` : result
        })
      else
        @cy.JS.tsvParse(string).map{|e| `Opal.hash(e)` }
      end
    end

    def csv_format(rows, columns=`undefined`)
      @cy.JS.csvFormat(rows.to_n, columns)
    end

    def tsv_format(rows, columns=`undefined`)
      @cy.JS.tsvFormat(rows.to_n, columns)
    end
  end
end
