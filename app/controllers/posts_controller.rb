class PostsController < ApplicationController
    before_filter :require_login, :only => [:new, :edit, :update, :create, :destroy]

    def index
        @posts = Post.order("created_at DESC").page(params[:page])
    end

    def archive
        @posts = Post.find(:all, :order => "created_at DESC").group_by { |post| post.created_at.beginning_of_month }
    end

    def new
        if not current_user
            redirect_to login_url, :notice => "You must login to create posts."
        else
            @post = Post.new
        end
    end

    def show
        @post = Post.find(get_id(params[:id]))
    end

    def edit
        @post = Post.find(get_id(params[:id]))
        render :new
    end

    def create
        @post = Post.new post_params
        @post.user = current_user
        @post.slug = @post.title.to_slug

        if @post.save
            redirect_to @post, :notice => "Article created."
        else
            render :new
        end
    end

    def update
        @post = Post.find(get_id(params[:id]))

        if @post.update_attributes(post_params)
            redirect_to @post, :notice => "Post updated."
        else
            render :new
        end
    end

    def destroy
        @post = Post.find(get_id(params[:id]))
        @post.delete

        redirect_to root_url, :notice => "Post removed."
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    def get_id(str)
        str.split("-")[-1]
    end
end
