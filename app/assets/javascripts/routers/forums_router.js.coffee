class BackboneMongo.Routers.Forums extends Backbone.Router
  routes:
    "": "index"

  initialize: ->
    @collection = new BackboneMongo.Collections.Forums()
    @collection.fetch({reset: true})
    
  index: ->
    view = new BackboneMongo.Views.ForumsIndex(collection: @collection)
    $('#wrapper').html(view.render().el)