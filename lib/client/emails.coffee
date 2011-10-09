Backbone = require 'backbone'
Email = require 'email'

class Emails extends Backbone.Collection
  model: Email
  url: "/emails"

module.exports = Emails
