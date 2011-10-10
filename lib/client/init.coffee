require 'jquery'
Backbone = require 'backbone'
Router = require 'router'

@router = new Router

jQuery ->
  Backbone.history.start()
