class BackboneMongo.Views.CommentsIndex extends Backbone.View

  template: JST['comments/index']
  tagName: "div"
  className: "CommentIndex"
    
  initialize: ->
    @options.comments.on('reset', @render, this)
    @options.comments.on('change', @render, this)
    
  render: ->
    $(@el).html(@template())
    @options.comments.each(@appendComment, this)
    this
  
  appendComment: (comment) ->
    view = new BackboneMongo.Views.Comment(model: comment)
    $(@el).find(".comment-list").append(view.render().el)
    