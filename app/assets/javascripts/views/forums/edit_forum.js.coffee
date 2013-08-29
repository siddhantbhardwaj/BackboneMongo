class BackboneMongo.Views.EditForum extends Backbone.View
  
  template: JST['forums/edit_forum']

  events:
    "click #cancel_btn": "cancelEdit"
    "submit #edit_forum": "update"

  render: ->
    $(@el).html(@template(forum: @model))
    @$('#edit_forum_creator_name').val(@model.get("creator_name"))
    @$('#edit_forum_title').val(@model.get("title"))
    @$('#edit_forum_content').val(@model.get("content"))
    this
    
  update: (event)  ->
    event.preventDefault()
    event.stopPropagation()
    @model.save({creator_name: $('#edit_forum_creator_name').val(), title: $('#edit_forum_title').val(), content: $('#edit_forum_content').val() })
    view = new BackboneMongo.Views.Forum(model: @model)
    $(@el).closest('li').find(".forum-header").replaceWith($(view.render().el).find(".forum-header"));
    $(@el).closest('li').find(".forum-content").replaceWith($(view.render().el).find(".forum-content"));
    $("form#edit_forum")[0].reset()
    $(".edit_form_container").html("")
    
  cancelEdit: ->
    $(".edit_form_container").html("")