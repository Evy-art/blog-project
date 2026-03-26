class CommentsController < ApplicationController
    before_action :set_blog
    before_action :set_comment, only: [:edit, :update, :destroy]

    def create
        @comment = @blog.comments.build(comment_params)

        if @comment.save
            redirect_to blogs_path(anchor: "blog-#{@blog.id}"), notice: "Comment added!"
        else
            redirect_to blogs_path(anchor: "blog-#{@blog.id}"), alert: "Failed to add comment."
        end
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to blogs_path(anchor: "blog-#{@blog.id}"), notice: "Comment updated successfully."
        else
            render :edit, status: :unprocessable_entity
    end
end

    def destroy
        @comment.destroy
        redirect_to blogs_path(anchor: "blog-#{@blog.id}"), notice: "Comment deleted successfully."
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
