class PostTagsController < ApplicationController
    before_filter :require_login, :only => [:create, :destroy]

    def create
        post = Post.find(params[:post_id])
        tag = Tag.find(params[:tag_id])

        begin
            post.tags << tag
        rescue ActiveRecord::RecordInvalid
            redirect_to post, :notice => "Tag already added."
        else
            redirect_to post, :notice => "Tag added to post." 
        end
    end

    def destroy
        post_tag = PostTag.find(params[:id])
        post = post_tag.post
        post_tag.destroy

        redirect_to post, :notice => "Tag removed from post."
    end
end
