class BackboneMongo.Views.CommentNew extends Backbone.View
  
  template: JST['comments/comment_new']
    
  initialize: ->
    @model = new @collection.model()
  
  events: ->
    "submit #new_comment": "createComment"

  render: ->
    $(@el).html(@template())
    this
    
  createComment: (event) ->
    event.preventDefault()
    @model.set({creator_name: @$('#creator_name').val(), content: @$('#content').val(), forum: @collection.forum_id.id })
    @collection.create(@model)
    @model = new @collection.model()
    @$("form")[0].reset()