class PostsController < ApplicationController
    
    before_action :login, except: [:index]
    
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        #@post = Post.new(post_params)
        @post = current_user.posts.new(post_params)
    
        if @post.save
          redirect_to posts_url
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    private

    def login
      unless user_signed_in?
        flash[:error] = "signed in to create post"
        redirect_to new_user_session_url
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
