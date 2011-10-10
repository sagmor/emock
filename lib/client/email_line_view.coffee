_ = require 'underscore'
Backbone = require 'backbone'

class EmailLineView extends Backbone.View
  tagName: "li"

  render: ->
    $(@el).html _.template( $('#emailLine').html() )
      email: @model.toJSON()
    @
  
module.exports = EmailLineView
