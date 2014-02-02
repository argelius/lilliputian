class TagsController < ApplicationController
    before_filter :require_login, :only => [:create, :destroy]

    def index
        @tags = Tag.all
        @tag = Tag.new
    end

    def show
        @tag = Tag.find_by_tag params[:id]
        @posts = @tag.posts.order("created_at DESC").page(params[:page])

        render "posts/index"
    end

    def create
        @tag = Tag.new tag_params 

        if @tag.save
            redirect_to tags_path, :notice => "'#{@tag.tag}' added."
        else
            @tags = Tag.all
            render :index
        end
    end

    def destroy
        @tag = Tag.find_by_tag params[:id]
        @tag.delete

        redirect_to tags_path, :notice => "Tag removed."
    end

    private
    def tag_params
        params.require(:tag).permit(:tag)
    end
end
