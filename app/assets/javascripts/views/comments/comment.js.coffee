class BackboneMongo.Views.Comment extends Backbone.View

  template: JST['comments/comment']
  tagName: "li"
  className: "comment-block"

  events:=>
    "click .delete_comment_link": "deleteComment"
    
  render: ->
    $(@el).html(@template(comment: @model))
    this
    
  deleteComment: ->
    @model.destroy()
    @.remove()