window.BackboneMongo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BackboneMongo.Routers.Forums()
    Backbone.history.start()

$(document).ready ->
  BackboneMongo.initialize()
