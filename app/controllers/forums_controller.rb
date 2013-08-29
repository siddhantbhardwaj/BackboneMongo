class ForumsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Forum.all.sort(_id: 1)
  end
  
  def show
    respond_with Forum.find(params[:id])
  end
  
  def create
    respond_with Forum.create(params[:forum])
  end
  
  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(title: params[:forum][:title], creator_name: params[:forum][:creator_name], content: params[:forum][:content])
      respond_with @forum
    end
  end
  
  def destroy
    respond_with Forum.find(params[:id]).destroy()
  end
  
  
end
