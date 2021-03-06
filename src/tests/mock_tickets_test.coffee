###
# test for mock_tickets
###

## Module dependencies
should = require "should"

{TicketManager} = require "../"

config = require("../config/config")['development']

debuglog = require("debug")("ticketman:test:mock_tickets_test")
async = require "async"

ticketManager = new TicketManager("test ticket_manager", "http://localhost:3456")

## Test cases
describe "test mock_tickets", ->

  @timeout 30 * 1000

  it "should moch 100 tickets", (done) ->

    content =
      detailed : "content of ticket",
      mixed : ["data"]

    title = "test ticket #{Date.now().toString(36)}"
    category = "test"

    arr = []
    for i in [0..100]
      arr.push i

    iterator = (item, callback)->
      title = "#{title}-#{item}"
      debuglog "[iterator] issue ticket:#{title}"
      ticketManager.issue title, category, content, callback

    async.each arr, iterator, done







