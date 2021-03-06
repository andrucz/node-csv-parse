
fs = require 'fs'
parse = require '../src'

describe 'options "auto_parse_date" (deprecated)', ->
  
  it 'convert numbers', (next) ->
    data = []
    parser = parse """
    2000-01-01,date1
    2050-11-27,date2
    """,
      auto_parse: true
      auto_parse_date: true
    , (err, records) ->
      records.should.eql [
        [ new Date('2000-01-01T00:00:00.000Z'), 'date1' ],
        [ new Date('2050-11-27T00:00:00.000Z'), 'date2' ]
      ]
      next err
