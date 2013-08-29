class BackboneMongo.Views.ForumsIndex extends Backbone.View

  template: JST['forums/index']

  events:
    "submit #new_forum": "createForum"
    "click #new_forum_link": "showNewForumForm"

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendForum, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendForum)
    this

  appendForum: (forum) ->
    view = new BackboneMongo.Views.Forum(model: forum)
    $('#forum_container').prepend(view.render().el)
    comments_view = new BackboneMongo.Views.CommentsIndex(comments: forum.get('comments'))
    view.$el.append(comments_view.render().el)
    new_comment_view = new BackboneMongo.Views.CommentNew(collection: forum.get('comments'))
    view.$(".new_comment").html(new_comment_view.render().el)

  createForum: (event) ->
    event.preventDefault()
    @collection.create({ creator_name: $('#new_forum_creator_name').val(), title: $('#new_forum_title').val(), content: $('#new_forum_content').val()},
      wait: true
      success: ->
        $('#new_forum')[0].reset()
        $('#new_forum').slideUp()
      error: @handleError
    )
  
  showNewForumForm: (event) ->
    event.preventDefault()
    $("#new_forum").slideDown()
    
  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        $('.display-errors').append "<div>#{attribute}: #{message}</div>" for message in messages
        $('.display-errors').fadeIn(1000).addClass("show").delay(5000).queue ->
          $(this).fadeOut 1000
          $(this).html("")
          $(this).removeClass "show"
          $(this).dequeue()
          