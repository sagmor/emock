_ = require 'underscore'
Backbone = require 'backbone'

class EmailView extends Backbone.View
  initialize: ->
    super
    _.bindAll(@,"render")
    @model.bind 'change', @render

  render: ->
    $(@el).html _.template( $('#email').html() )
      email: @model.toJSON()
    @
  
module.exports = EmailView

