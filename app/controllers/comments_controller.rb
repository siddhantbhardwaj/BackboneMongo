class CommentsController < ApplicationController
  respond_to :json
  
  def index
    @forum = Forum.find(params[:forum_id])
    @comments = @forum.comments if @forum
    respond_with @comments
  end
  
  def create
    @forum = Forum.find(params[:forum])
    respond_with @forum.comments.create!(params[:comment])
  end
  
  def update
    forum = Forum.where('comments._id' => Moped::BSON::ObjectId(params[:id])).first
    raise "Forum not found" unless forum.is_a? Forum
    comment = forum.comments.detect { |cmnt| cmnt.id.to_s == params[:id] }
    respond_with comment.update_attributes(params[:comment])
  end
  
  def destroy
    forum = Forum.where('comments._id' => Moped::BSON::ObjectId(params[:id])).first
    comment = forum.comments.detect { |cmnt| cmnt.id.to_s == params[:id] }
    comment.destroy
    respond_with :no_content
  end
  
  
end
