class ForumsController < ApplicationController
	def index
		@forums = Forum.all
	end

  def show
    @forum = Forum.find(params[:id])
    @posts = Post.where(forum_name: @forum.forum_name)
  end

  def new
    @forum = Forum.new
  end

  def create
  	@forum = Forum.create forum_name: params[:forum_name],
                 description: params[:description],
                 admin_user: User.find_by(id: session[:user_id]).user_name

    if @forum.save
      redirect_to root_url, notice: "Forum Created."
    else
      render "new"
    end
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    @forum.update forum_name: params[:forum_name],
                 description: params[:description],
                 admin_user: User.find_by(id: session[:user_id]).user_name

    redirect_to forum_url(@forum.id)
  end

  def destroy
    Forum.delete(params[:id])
    redirect_to root_url
  end


end