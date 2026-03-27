class CommentsController < ApplicationController
    before_action :set_blog
    before_action :set_comment, only: [:edit, :update, :destroy]

    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

    def create
        @comment = @blog.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to blogs_path(anchor: "blog-#{@blog.id}"), notice: "Comment added!"
        else
            redirect_to blogs_path(anchor: "blog-#{@blog.id}"), alert: "Failed to add comment."
        end
    end

    def edit
        redirect_to blogs_path, alert: "Not suthorized." unless @comment.user == current_user
    end

    def update
        if @comment.user == current_user && @comment.update(comment_params)
            redirect_to blogs_path(anchor: "blog-#{@blog.id}"), notice: "Comment updated successfully."
        else
            redirect_to blogs_path, alert: "Not authorized or failed update."
    end
end

    def destroy
        if @comment.user == current_user
        @comment.destroy
        redirect_to blogs_path(anchor: "blog-#{@blog.id}"), notice: "Comment deleted successfully."
        else
            redirect_to blogs_path, alert: "Not authorized."
    end
end

    private

    def set_blog
        @blog = Blog.find(params[:blog_id])
    end

    def set_comment
        @comment = @blog.comments.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
