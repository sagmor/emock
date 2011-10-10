_ = require 'underscore'
Backbone = require 'backbone'

EmailLineView = require 'email_line_view'

class EmailsView extends Backbone.View
  initialize: ->
    super
    _.bindAll(@,"render")
    @collection.bind 'reset', @render

  render: ->
    $(@el).html _.template( $('#emails').html() )()

    @collection.each (email) ->
      view = new EmailLineView
        model: email

      @$('ul').append view.render().el

    @
  
module.exports = EmailsView
