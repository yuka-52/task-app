class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    
    @post_count = Post.all.count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "投稿を作成しました"
        redirect_to :posts
      else
        render "new"
      end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = "ユーザーIDが「#{@post.id}」のスケジュールを更新しました"
        redirect_to :posts
      else
        render "edit"
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end

  private
  
  def post_params
      params.require(:post).permit(
        :title,
        :start_day,
        :end_day,
        :all_day,
        :memo
    )
    end
  end
        

