class BackboneMongo.Views.Forum extends Backbone.View

  template: JST['forums/forum']
  tagName: "li"
  className: "forum-block"

  events:
    "click .delete_forum_link": "deleteForum"
    "click .edit_forum_link": "showEditForumForm"
    	
  render: ->
    $(@el).html(@template(forum: @model))
    this

  deleteForum: ->
    @model.destroy()
    @.remove()

  showEditForumForm: ->
    view = new BackboneMongo.Views.EditForum(model: @model)
    @$('.edit_form_container').html(view.render().el)
    