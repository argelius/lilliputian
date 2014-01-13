class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        if not current_user
            redirect_to login_url, :notice => "You must login to create posts."
        else
            @post = Post.new
        end
    end

    def show
        @post = Post.find params[:id]
    end

    def create
        @post = Post.new post_params
        @post.user = current_user

        if @post.save
            redirect_to @post, :notice => "Article created."
        else
            render :new
        end
    end

    def preview
        @post = Post.new post_params

        render "show"
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end
end
