Backbone = require 'backbone'

class Email extends Backbone.Model
  url: ->
    "/emails/#{@id}"

module.exports = Email
